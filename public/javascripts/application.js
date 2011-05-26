// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(document).ready(function() {
  
  $("#login_menu").hide();
  $(".nav_login_link").click(function()
	 		{
				jQuery("#login_menu").fadeIn(500);
	 		});
});
// 
// $.ajaxSetup({
//   headers: {
//     "X-CSRF-Token": $("meta[name='csrf-token']").attr('content')
//   }
// });
// $(function() {
//   var faye = new Faye.Client('http://localhost:9292/faye');
//   faye.subscribe("/chat", function(data) {
//     eval(data);
//   });
// });