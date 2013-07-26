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

    request.done(function(){
      button.removeClass('btn-primary');
      button.text("You been Boked!");
      button.addClass('btn-success');
    });
  })
});
