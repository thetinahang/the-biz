# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_queries_path(@user)
    else
      redirect_to '/login'
    end
  end

  def destroy  
    session[:user_id] = nil         
    redirect_to root_path
  end 

  def login; end

  def welcome; end

  def page_requires_login; end
end
