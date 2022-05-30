class RoutesController < ApplicationController
  before_action :set_route, only: %i[ show edit update destroy ]
  swagger_controller :routes, 'Routes'

  # GET /routes or /routes.json
  swagger_api :index do
    summary 'Returns all routes'
    notes 'Notes...'
  end
  def index
    @routes = Route.all
  end

  # GET /routes/1 or /routes/1.json
  swagger_api :show do
    summary 'Returns one route'
    param :path, :id, :integer, :required, "Routes id"
    notes 'Notes...'
  end
  def show
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
  end

  # POST /routes or /routes.json
  swagger_api :create do
    summary "Create a route"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :form, "route[route_name]", :string, :required, "Route name"
    param :form, "route[r_description]", :string, :required, "Route description" 
  end
  def create
    @route = Route.new(route_params)

    respond_to do |format|
      if @route.save
        format.html { redirect_to route_url(@route), notice: "Route was successfully created." }
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routes/1 or /routes/1.json
  swagger_api :update do
    summary "Update a route"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :path, :id, :integer, :required, "Route id"
    param :form, "route[route_name]", :string, :required, "Route name"
    param :form, "r_description", :string, :required, "Route description"
  end
  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to route_url(@route), notice: "Route was successfully updated." }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1 or /routes/1.json
  swagger_api :destroy do
    summary 'Destroys a route'
    param :header, "Authorization", :string, :required, "Authentication token"
    param :path, :id, :integer, :required, "Route id"
    notes 'Notes...'
  end
  def destroy
    @route.destroy

    respond_to do |format|
      format.html { redirect_to routes_url, notice: "Route was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def route_params
      params.require(:route).permit(:route_name, :r_description)
    end
end
