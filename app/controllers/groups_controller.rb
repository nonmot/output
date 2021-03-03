class GroupsController < ApplicationController

    def new
        @group = Group.new
    end
    
    def create
        @group = Group.new(group_params)
        @group.user_id = current_user.id
        if @group.save
            redirect_to "/pages/show"
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
