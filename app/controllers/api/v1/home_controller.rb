class Api::V1::HomeController < ApplicationController
  def index
    render json: {message: "Welcome, you now authenticated!"}, status: 200
  end
end
