// Override the default confirm dialog from rails
$.rails.allowAction = function(link) {
  if (link.data("confirm") == undefined) {
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}

// User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}

// Display the confirmation dialog
$.rails.showConfirmationDialog = function(link) {
  var message = link.data("confirm");

  $('body').prepend("<div class='modal-wrapper'><div class='inner-box modal-box' style='width: 500px;'><div class='row'><div class='col-sm-12' style='text-align: center;'><p style='margin-bottom: 20px; font-size: 15px;'>" + message + "</p></div></div><span class='break-row'></span><div class='row'><div class='col-sm-12' style='margin-top: 10px; text-align: center;'><button type='button' id='modal-confirm' class='btn btn-primary' style='margin-right: 5px;'>Confirm</button><button type='button' id='modal-cancel' class='btn btn-default'>Cancel</button></div></div></div></div>");

  $('#modal-confirm').on("click", function(e) {
    $.rails.confirmed(link);
    $('.modal-wrapper').remove();
  });

  $("#modal-cancel").on("click", function(e) {
    $('.modal-wrapper').remove();
  });
}
