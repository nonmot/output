class GroupsController < ApplicationController
    before_action :authenticate_user!

    def index
        @groups = current_user.groups.all
    end

    def new
        @group = current_user.groups.build
    end
    
    def create
        @group = current_user.groups.build(group_params)
        @group.users << current_user
        @group.user_id = current_user.id
        if @group.save
            redirect_to "/groups"
            flash[:success] = "グループを作成しました！"
        else
            flash[:danger] = "グループの作成に失敗しました。"
            render "groups/new"
        end
    end

    private
        def group_params
            params.require(:group).permit(:title)
        end
end
