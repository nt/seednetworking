// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
$("#seeking_other").focusin(function(){
  $("input:radio").prop('checked', false);
});

});