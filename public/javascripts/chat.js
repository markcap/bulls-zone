

// Enable pusher logging - don't include this in production
Pusher.log = function(message) {
  if (window.console && window.console.log) window.console.log(message);
};

// Flash fallback logging - don't include this in production
WEB_SOCKET_DEBUG = true;

var pusher = new Pusher('106d110d7efa2719e789'); // uses your API KEY
var channel = pusher.subscribe('bulls_zone');

channel.bind('send_chat', function(data) {
  $("#new_chat_message")[0].reset();
  obj = $("#chat_room");
  $("#chat").append('<li><span class=\'chat_time\'>' + data.created_at + '</span> <span class=\'chat_username\'>' + data.username + '</span> ' + data.message + '</li>');
  if( (obj.scrollTop() + 20) > (obj[0].scrollHeight - obj[0].offsetHeight)) {
    $("#chat_room").attr({ scrollTop: $("#chat_room").attr("scrollHeight") });
  }
});
// jQuery(document).ready(function() {
// $("#new_chat_message").submit(function() {
//   $("#new_chat_message")[0].reset();
// });
// });


