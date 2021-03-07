class PagesController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @groups = Group.where(user_id: current_user.id)
  end
end
