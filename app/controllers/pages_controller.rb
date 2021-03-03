class PagesController < ApplicationController
  def index
  end

  def show
    @groups = Group.where(user_id: current_user.id)
  end
end
