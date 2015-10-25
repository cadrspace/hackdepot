class UsersController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]
  respond_to :html, :json

  def profile
    if params[:id]
      @profile = User.find(params[:id])
    else
      @profile = User.find(current_user.id)
    end
  end
end
