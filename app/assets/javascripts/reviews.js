$(document).ready(function() {

  $("button#show-reviews").on('click', function(e){
    e.preventDefault();
    $("#reviews-container p").hide();
    $("#reviews-container span").show();
    $("#reviews-container .hidden").removeClass("hidden");
    $(this).hide();
  });

});
