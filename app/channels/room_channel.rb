class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['group']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(content: data['message'], group_id: params['group'], user_id: current_user.id)
  end
end
