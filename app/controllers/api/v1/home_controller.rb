# frozen_string_literal: true

module Api
  module V1
    # Home API controller
    class HomeController < ApplicationController
      def index
        render json: { message: 'Welcome, you are now authenticated!' }, status: 200
      end
    end
  end
end
