$(document).ready(function() {

  $('.appt_book').on('click', function(e){
    e.preventDefault();

    var button = $(this);
    console.log(button.data('appointmentid'));

    var request = $.ajax({
      url: "/appointments/book",
      type: "put",
      data: { appointment_id: button.data('appointmentid')}
    });

    request.done(function(appt_count){
      button.removeClass('btn-primary');
      button.text("You been Booked!");
      button.addClass('btn-success');
      $('.massage_count').text(appt_count);
    });
  });


  $('#add-another-appointment').on('click', function() {
    $('.appointment-new').first().clone().toggle().prependTo("#appointment-list");
  });

});
