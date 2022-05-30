class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  swagger_controller :profiles, 'Profiles'

  # GET /profiles or /profiles.json
  swagger_api :index do
    summary 'Returns all profiles'
    notes 'Notes...'
  end
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1 or /profiles/1.json
  swagger_api :show do
    summary 'Returns one profile'
    param :path, :id, :integer, :required, "Profiles id"
    notes 'Notes...'
  end
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  swagger_api :create do
    summary "Create a profile"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :form, "profile[title]", :string, "Profile title"
    param :form, "user_id", :integer, :required, "User id"
    param :form, "route_id", :integer, :required, "Route id"
    param :form, "role_id", :integer, :required, "Role id"
  end
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  swagger_api :update do
    summary "Update a profile"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :path, :id, :integer, :required, "Profile id"
    param :form, "profile[title]", :string, "Profile title"
    param :form, "user_id", :integer, :required, "User id"
    param :form, "route_id", :integer, :required, "Route id"
    param :form, "role_id", :integer, :required, "Role id"
  end
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  swagger_api :destroy do
    summary "Destroy a profile"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :path, :id, :integer, :required, "Profile id"
  end
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:user_id, :role_id, :route_id, :title)
    end
end
