$(function(){
  return App.room = App.cable.subscriptions.create({
    channel: "RoomChannel",
    room_id: $('#messages').data('room-id'),
    creator_id: $('#messages-creator').data('creator-id'),
    user_id: $('#messages-user').data('user-id')
  }, {
    connected: function() {

    },
    disconnected: function() {

    },
    received: function(data) {
      var show_user;
      show_user = $('#show_user').data('show-user');
      show_creator = $('#messages-creator').data('creator-id');
      show_creator1 = $('#messages-creator-1').data('creator-id');
      show_user = $('#messages-user').data('user-id');
      console.log(show_creator);
      console.log(show_creator1);
      console.log(show_user);
      console.log(data['chat_user']);
      console.log(show_user);
      if (data['chat_user'] === show_user || show_creator === show_creator1) {
        $('.chat_box').animate({scrollTop : $('.chat_box')[0].scrollHeight });
        $('.chat_box').append(data['message_right']);
      } else {
        $('.chat_box').animate({scrollTop : $('.chat_box')[0].scrollHeight });
        $('.chat_box').append(data['message_left']);
      }
    },
    speak: function(message) {
      return this.perform('speak', {
        message: message
      });
    }
  });
});

$(document).on('keydown', '[data-behavior~=room_speaker]', function(event) {
  if (event.ctrlKey && event.keyCode === 13) {
    App.room.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
});

$(document).on('click', '.chat_submit', function() {
  App.room.speak($('[data-behavior~=room_speaker]').val());
  $('[data-behavior~=room_speaker]').val('');
  return event.preventDefault();
});