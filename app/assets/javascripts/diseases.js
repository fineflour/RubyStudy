// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $("#disease_indication").change(function(){
//      $(this).parents('.lender_field_code').find('.lender_field_name').text($(this).find('option: select').text()); 
//      var chosen = $(this).find(":selected");
      alert('haha');
//      alert(chosen.value);
  });
});

$(document).ready(function() {
$('.lender_field_code_select').bind('change',function () {    
      $(this).parents('.lender_field_code').find('.lender_field_name').text($(this).find('option: select').text()); 
});
});
