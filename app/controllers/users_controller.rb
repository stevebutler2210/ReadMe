# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user).serializable_hash[:data][:attributes]
  end
end
