class Api::GroupsController < ApplicationController

    def index
        groups = Group.order('created_at DESC')
        user = current_user
        object = {
            groups: groups,
            user: user
        }
        render json: object
    end

    def show
        group = Group.find_by(id: params[:id])
        user = User.find_by(id: group.user_id)
        json = {
            group: group,
            user: user
        }
        render json: json
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

    def destroy
        group = Group.find_by(id: params[:id])
        if group.destroy
            render json: {status: 'SUCCESS'}
        else
            render json: {statis: 'ERROR'}
        end
    end

    private

        def group_params
            params.require(:group).permit(:title, :introduction)
        end
end
