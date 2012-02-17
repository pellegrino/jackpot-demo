$(document).ready(function() {

  $("#subscriptions-list").find('li').click(function (){
    window.location.href = $(this).find('a').attr('href');
  });

});
