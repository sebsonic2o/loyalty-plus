$(document).ready(function() {

  $('textarea').each(function() {
    if ($(this).val() == $(this).attr('placeholder')) {
      $(this).val('');
    }
  });
});
