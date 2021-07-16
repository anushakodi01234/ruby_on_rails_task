$(document).ready(function(){
  // Hide the Toast
  $("#myToast").hide();
  $(".show-toast").click(function(){
      $("#myToast").toast('show');
  });
  $(".hide-toast").click(function(){
      $("#myToast").toast('hide');
  });
  $(".dispose-toast").click(function(){
      $("#myToast").toast('dispose');
  });
});