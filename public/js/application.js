
function clearButtonClasses(button) {
  button.removeClass('btn-info btn-success btn-primary');
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
  // clearButtonClasses(button);
  // button.fadeOut(500, function() {
  //   button.text(message).fadeIn(500);
  // });
  // button.addClass('btn-danger');
}

function passBooking(button, message) {
  updateButton(button,'btn-success',message);
  // clearButtonClasses(button);
  // button.fadeOut(500, function() {
  //   button.text(message).fadeIn(500);
  // });
  // button.addClass('btn-success');
  // $('.massage_count').text(data.appt_count);
}

$(document).ready(function() {

  $('.appt_book').on('click', function(e){
    e.preventDefault();

    var button = $(this);
    console.log(button);
    console.log(button.data('appointmentid'));

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
        console.log(data);
        if (data.booked === true)
        {
          console.log("passed");
          passBooking(button, (button.text() +' Booked!'));
          updateMassageCount(data.appt_count);
        }
        else
        {
          failBooking(button, "Don't be greedy now...");
        }
      });

      request.fail(function(data){
        failBooking(button,"Server Error");
        // console.log("in the fail")
        // button.removeClass('btn-info btn-success btn-primary');
        // button.fadeOut(500, function() {
        //   button.text('Booking failed. Sorry...').fadeIn(500);
        // });
        // button.addClass('btn-danger');
      });
    }
  });


  $('#add-another-appointment').on('click', function() {
    $('.appointment-new').first().clone().toggle().prependTo("#appointment-list");
  });

});




