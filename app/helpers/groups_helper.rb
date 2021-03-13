module GroupsHelper
    def owner(user_id)
        owner = User.find_by(id: user_id)
        return owner
    end
end
