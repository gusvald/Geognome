class StaticController < ApplicationController
  before_action :require_token, only: [:gnomesss]
  swagger_controller :static, 'Static'

    def index
  		@routes = Route.all
  		@gnomes = Gnome.all
  		@roles = Role.all
    end

    swagger_api :gnomesss do
      summary "Shows a profile site for authenticated user - test site"
      param :header, "Authorization", :string, :required, "Authentication token"
    end
    def gnomesss


    end


  end