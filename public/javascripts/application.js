// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(document).ready(function() {
  
  $("#login_menu").hide();
  $(".nav_login_link").click(function()
	 		{
				jQuery("#login_menu").fadeIn(500);
	 		});
});