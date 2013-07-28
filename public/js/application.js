$(document).ready(function() {

  $('.appt_book').on('click', function(e){
    e.preventDefault();

    var button = $(this);
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
          button.removeClass('btn-info btn-success btn-primary');
          button.fadeOut(500, function() {
            button.text('Booked!').fadeIn(500);
          });
          button.addClass('btn-success');
          $('.massage_count').text(data.appt_count);
        }
        else
        {
          button.removeClass('btn-info btn-success btn-primary');
          button.fadeOut(500, function() {
            button.text("Don't be greedy now...").fadeIn(500);
          });
          button.addClass('btn-danger');
        }
      });

      request.fail(function(appt_count){
        console.log("in the fail")
        button.removeClass('btn-info btn-success btn-primary');
        button.fadeOut(500, function() {
          button.text('Booking failed. Sorry...').fadeIn(500);
        });
        button.addClass('btn-danger');
      });
    }
  });


  $('#add-another-appointment').on('click', function() {
    $('.appointment-new').first().clone().toggle().prependTo("#appointment-list");
  });

});
