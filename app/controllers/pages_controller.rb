class PagesController < ApplicationController
  def index
    @groups = Group.all
  end

  def user
    @user = User.find_by(id: params[:id])
  end
end
