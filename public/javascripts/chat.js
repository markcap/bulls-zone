
jQuery(document).ready(function() {
  $("#new_chat_message").submit(function(){
    setTimeout(function(){
      $("#new_chat_message")[0].reset();
    }, 10)
  });
});

// // Enable pusher logging - don't include this in production
// Pusher.log = function(message) {
//   if (window.console && window.console.log) window.console.log(message);
// };
// 
// // Flash fallback logging - don't include this in production
// WEB_SOCKET_DEBUG = true;

var pusher = new Pusher('106d110d7efa2719e789');
var channel = pusher.subscribe('presence-bulls_zone');


channel.bind('pusher:subscription_succeeded', function(members) {
  members.each(function(member) {
    add_member(member);
  })
  order_list();
})

channel.bind('pusher:member_added', function(member){
   add_member(member);
   send_notification(member.info.name + ' has enetered the room.');
   order_list();
})
 
channel.bind('pusher:member_removed', function(member){
    $(".number_of_users").text(parseInt($(".number_of_users").text()) - 1);
    $("#users li." + member.info.name).remove();
    send_notification(member.info.name + ' has left the room.')
})

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

// 
// channel.bind('client-remove_user', function(data) {
//   $(".number_of_users").html(parseInt($(".number_of_users").html()) - 1);
//   $("." + data.username).remove();
//   $("#chat").append('<span class="chat_notification"> ' + data.username + ' has left the room.</span></li>');
// });

function add_member(member) {
  $("#users").append('<li class=\'' + member.info.name + '\'><span class=\'' + member.info.name + '\'>' + member.info.name + '</span></li>');
  $(".number_of_users").text(parseInt($(".number_of_users").text()) + 1);
}

function send_notification(string) {
  obj = $("#chat_room");
  $("#chat").append('<li><span class="chat_notification"> ' + string + '</span></li>');
  if( (obj.scrollTop() + 35) > (obj[0].scrollHeight - obj[0].offsetHeight)) {
    $("#chat_room").attr({ scrollTop: $("#chat_room").attr("scrollHeight") });
  }
}

function order_list() {
   var mylist = $('#users');
   var listitems = mylist.children('li').get();
   listitems.sort(function(a, b) {
      var compA = $(a).attr("class").toUpperCase();
      var compB = $(b).attr("class").toUpperCase();
      return (compA < compB) ? -1 : (compA > compB) ? 1 : 0;
   })
   $.each(listitems, function(idx, itm) { mylist.append(itm); });
}