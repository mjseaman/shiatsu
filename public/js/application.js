
function clearButtonClasses(button) {
  button.removeClass('btn-info btn-success btn-primary available unavailable booked');
}

function updateButton(button,cssClass,message) {
  clearButtonClasses(button);
  button.fadeOut(500, function() {
    button.text(message).fadeIn(500);
  });
  button.addClass(cssClass);
}

function updateMassageCount(count) {
  $('.massage_count').text(count);
}

function failBooking(button,message) {
  updateButton(button,'btn-danger',message);
}

function passBooking(button, message) {
  updateButton(button,'btn-success booked',message);
}

$(document).ready(function() {

  $('.appt_book').on('click', function(e){
    e.preventDefault();

    var button = $(this);
    var time = button.data('time');
  
    if (button.hasClass('unavailable'))
      {
        void(0);
      }
    else if (button.hasClass('available'))
    {
      var request = $.ajax({
        url: "/appointments/book",
        type: "put",
        data: { appointment_id: button.data('appointmentid')}
      });

      request.done(function(data){
        if (data.booked === true)
        {
          passBooking(button, (time + " Booked!"));
          updateMassageCount(data.appt_count);
        }
        else
        {
          failBooking(button, "Don't be greedy now...");
        }
      });

      request.fail(function(data){
        failBooking(button,"Server Error");
      });
    }
    else if (button.hasClass('booked'))
    {
      var request = $.ajax({
        url: "/appointments/unbook",
        type: "put",
        data: { appointment_id: button.data('appointmentid')}
      });

      request.done(function(data) {
        updateButton(button,"available btn-info",(time + " Unbooked!"));
        updateMassageCount(data.appt_count);
      });
    }
    
  

  });

  /* Therapist Bookings*/
  $('.show_appt dropdown').on('hover', function(e){
    $('.dropdown-toggle').dropdown();
  });

  // Therapist delete appointment 
  $('.delete_appt').on('click', function(e){
    e.preventDefault();

    var request = $.ajax({ url: $(this).find('a').attr('href'), type: 'delete' });
    console.log($(this).find('a').attr('href'));
    request.done(function () { document.location.reload(); });
  });

  // dynamic form to add more appointment blocks
  $('#add-appt-block').on('click', function() {
    $('.appt-new').last().clone().appendTo("#appt-list").show();
  });
});
