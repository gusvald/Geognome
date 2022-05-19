class StaticController < ApplicationController
    def index
  		@routes = Route.all
    end
  end