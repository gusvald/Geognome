class StaticController < ApplicationController
    def index
  		@routes = Route.all
  		@gnomes = Gnome.all
  		@roles = Role.all
    end
  end