module MessagesHelper
    def username(message)
        user_id = message.user_id
        user = User.find_by(id: user_id)
        return user.name
    end
end
