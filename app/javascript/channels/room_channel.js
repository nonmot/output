import consumer from "./consumer"

$(function() {
  const appRoom = consumer.subscriptions.create({channel: "RoomChannel", group: $('#messages').data('group_id')}, {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      const messages = document.getElementById('messages');
      messages.insertAdjacentHTML('beforeend', data['message']);
    },
  
    speak: function(message) {
      return this.perform('speak', {message: message});
    }
  });
  
  window.addEventListener("keypress", function(e) {
    // エンターが押されたときの処理
    if(e.keyCode === 13) {
      // room_channel.jsのspeakメソッドにフォームから送信されたデータを渡す
      appRoom.speak(e.target.value);
      e.target.value = "";
      e.preventDefault();
    }
  });
});
