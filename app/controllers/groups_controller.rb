class GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_owner?, only: [:edit, :update, :destroy]

    def index
        @groups = current_user.groups.all
    end

    def show
        @group = Group.find_by(id: params[:id])
        @message = Message.new
        @messages = Message.where(group_id: params[:id])
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

    def edit
        @group = Group.find_by(id: params[:id])
    end

    def update
        @group = Group.find_by(id: params[:id])
        if @group.update(group_params)
            flash[:success] = "グループを更新しました。"
            redirect_to @group
        else
            render "groups/edit"
        end
    end

    def join
        @group = Group.find_by(id: params[:id])
        if @group && !already_join?
            @group.users << current_user
            redirect_back(fallback_location: root_path)
        else
            redirect_to root_url
        end
    end

    def destroy
        @group.destroy
        flash[:success] = "グループを削除しました。"
        redirect_to root_url
    end

    private
        # strong parameter
        def group_params
            params.require(:group).permit(:title, :introduction)
        end

        # グループのオーナーかどうか
        def is_owner?
            @group = Group.find_by(id: params[:id])
            current_user == @group.user_id
        end

        def already_join?
            @group = Group.find_by(id: params[:id])
            @group.users.include?(current_user)
        end
end
