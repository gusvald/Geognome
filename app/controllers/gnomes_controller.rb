class GnomesController < ApplicationController
  before_action :set_gnome, only: [:show, :edit, :update, :destroy, :like]
swagger_controller :gnome, 'Gnome'
  #!!!!!!!! TU TRZEBA SWAGGERA
  def like
    redirect_to "/gnomes"
  end
  # GET /gnomes or /gnomes.json
  swagger_api :index do
    summary 'Returns all gnomes'
    notes 'Notes...'
  end
  def index
    @gnomes = Gnome.all
  end

  # GET /gnomes/1 or /gnomes/1.json
  swagger_api :show do
    summary 'Returns one gnome'
    param :path, :id, :integer, :required, "Gnomes id"
    notes 'Notes...'
  end
  def show
  end

  # GET /gnomes/new
  def new
    @gnome = Gnome.new
  end

  # GET /gnomes/1/edit
  def edit
  end

  # POST /gnomes or /gnomes.json
  swagger_api :create do
    param :header, "Authorization", :string, :required, "Authentication token"
    summary "Create a gnome"
    param :form, "gnome[g_description]", :string, :required, "Gnome descriptiom"
    param :form, "gnome[gnome_name]", :string, :required, "Gnome name"
    param :form, "gnome[location_x]", :float, :required, "Gnome X"
    param :form, "gnome[location_y]", :float, :required, "Gnome Y"
    param :form, "route_id", :integer, :required, "Route id"
  end
  def create
    @gnome = Gnome.new(gnome_params)

    respond_to do |format|
      if @gnome.save
        format.html { redirect_to gnome_url(@gnome), notice: "Gnome was successfully created." }
        format.json { render :show, status: :created, location: @gnome }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gnome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gnomes/1 or /gnomes/1.json
  swagger_api :update do
    param :header, "Authorization", :string, :required, "Authentication token"
    summary "Update a gnome"
    param :path, :id, :integer, :required, "Gnome id"
    param :form, "gnome[g_description]", :string, :required, "Gnome descriptiom"
    param :form, "gnome[gnome_name]", :string, :required, "Gnome name"
    param :form, "gnome[location_x]", :float, :required, "Gnome X"
    param :form, "gnome[location_y]", :float, :required, "Gnome Y"
    param :form, "route_id", :integer, :required, "Route id"
  end
  def update
    respond_to do |format|
      if @gnome.update(gnome_params)
        format.html { redirect_to gnome_url(@gnome), notice: "Gnome was successfully updated." }
        format.json { render :show, status: :ok, location: @gnome }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gnome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gnomes/1 or /gnomes/1.json
  swagger_api :destroy do
    param :header, "Authorization", :string, :required, "Authentication token"
    summary 'Destroys a gnome'
    param :path, :id, :integer, :required, "Gnome id"
    notes 'Notes...'
  end
  def destroy
    @gnome.destroy

    respond_to do |format|
      format.html { redirect_to gnomes_url, notice: "Gnome was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gnome
      @gnome = Gnome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gnome_params
      params.require(:gnome).permit(:route_id, :gnome_name, :g_description, :location_x, :location_y)
    end
end
