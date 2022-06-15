class GnomesProfilesController < ApplicationController
  before_action :set_gnomes_profile, only: %i[ show edit update destroy ]

  # GET /gnomes_profiles or /gnomes_profiles.json
  def index
    @gnomes_profiles = GnomesProfile.all
  end

  # GET /gnomes_profiles/1 or /gnomes_profiles/1.json
  def show
  end

  # GET /gnomes_profiles/new
  def new
    @gnomes_profile = GnomesProfile.new(gnomes_profile_params)
  end

  # GET /gnomes_profiles/1/edit
  def edit
  end

  # POST /gnomes_profiles or /gnomes_profiles.json
  def create
    @gnomes_profile = GnomesProfile.new(gnomes_profile_params)

    respond_to do |format|
      if @gnomes_profile.save
        format.html { redirect_to gnomes_profile_url(@gnomes_profile), notice: "Gnomes profile was successfully created." }
        format.json { render :show, status: :created, location: @gnomes_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gnomes_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gnomes_profiles/1 or /gnomes_profiles/1.json
  def update
    respond_to do |format|
      if @gnomes_profile.update(gnomes_profile_params)
        format.html { redirect_to gnomes_profile_url(@gnomes_profile), notice: "Gnomes profile was successfully updated." }
        format.json { render :show, status: :ok, location: @gnomes_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gnomes_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gnomes_profiles/1 or /gnomes_profiles/1.json
  def destroy
    @gnomes_profile.destroy

    respond_to do |format|
      format.html { redirect_to gnomes_profiles_url, notice: "Gnomes profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gnomes_profile
      @gnomes_profile = GnomesProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gnomes_profile_params
      params.require(:gnomes_profile).permit(:gnome_id, :profile_id)
    end
end
