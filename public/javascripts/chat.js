
jQuery(document).ready(function() {
  $("#new_chat_message").submit(function(){
    setTimeout(function(){
      $("#new_chat_message")[0].reset();
    }, 10)
  });
});

// Enable pusher logging - don't include this in production
Pusher.log = function(message) {
  if (window.console && window.console.log) window.console.log(message);
};

// Flash fallback logging - don't include this in production
WEB_SOCKET_DEBUG = true;

var pusher = new Pusher('106d110d7efa2719e789'); // uses your API KEY
var channel = pusher.subscribe('presence-bulls_zone');
// var pres_channel = pusher.subscribe('presence-bulls_zone')

// Send a chat message
channel.bind('send_chat', function(data) {
  obj = $("#chat_room");
  $("#chat").append('<li><span class=\'chat_time\'>' + data.created_at + '</span> <span class=\'chat_username\'>' + data.username + ': </span> ' + data.message + '</li>');
  if( (obj.scrollTop() + 35) > (obj[0].scrollHeight - obj[0].offsetHeight)) {
    $("#chat_room").attr({ scrollTop: $("#chat_room").attr("scrollHeight") });
  }
});

//Message for entering or leaving a room
channel.bind('send_notification', function(data) {
  obj = $("#chat_room");
  $("#chat").append('<li><span class="chat_notification"> ' + data.message + '</span></li>');
  if( (obj.scrollTop() + 35) > (obj[0].scrollHeight - obj[0].offsetHeight)) {
    $("#chat_room").attr({ scrollTop: $("#chat_room").attr("scrollHeight") });
  }
});

channel.bind('add_user', function(data) {
  $(".number_of_users").html(parseInt($(".number_of_users").text()) + 1);
  $("#users").append('<li class=\'' + data.username + '\'><span class=\'' + data.user_type + '\'>' + data.username + '</span></li>');
});

channel.bind('client-remove_user', function(data) {
  $(".number_of_users").html(parseInt($(".number_of_users").html()) - 1);
  $("." + data.username).remove();
  $("#chat").append('<span class="chat_notification"> ' + data.username + ' has left the room.</span></li>');
});

// 
// pres_channel.bind('pusher:subscription_succeeded', function(members) {
//   // for example
//   update_member_count(members.count);
// 
//   members.each(function(member) {
//     // for example:
//     add_member(member.id, member.info);
//   })
// })

// Change user count when someone leaves
window.onbeforeunload = function () {
  var name = $(".menu_display_name").text();
  channel.trigger('client-remove_user', {username: name});
}