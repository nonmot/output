class Api::GroupsController < ApplicationController

    def index
        groups = Group.order('created_at DESC')
        render json: groups
    end

    def show
        group = Group.find_by(id: params[:id])
        render json: group
    end
end
