class Api::GroupsController < ApplicationController

    def index
        groups = Group.order('created_at DESC')
        user = current_user
        render json: groups
    end

    def show
        group = Group.find_by(id: params[:id])
        render json: group
    end

    def create
        group = Group.new(group_params)
        group.user_id = current_user.id
        if group.save
            render json: {status: 'SUCCESS'}
        else
            render json: {status: 'ERROR'}
        end
    end

    private

        def group_params
            params.require(:group).permit(:title, :introduction)
        end
end
