class StaticController < ApplicationController
  before_action :require_token, only: [:gnomesss]
    def index
  		@routes = Route.all
  		@gnomes = Gnome.all
  		@roles = Role.all
    end

    def gnomesss


    end


  end