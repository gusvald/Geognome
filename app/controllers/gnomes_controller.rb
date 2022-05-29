class GnomesController < ApplicationController
  before_action :set_gnome, only: [:show, :edit, :update, :destroy, :like]
  def like
    redirect_to "/gnomes"
  end
  # GET /gnomes or /gnomes.json
  def index
    @gnomes = Gnome.all
  end

  # GET /gnomes/1 or /gnomes/1.json
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
