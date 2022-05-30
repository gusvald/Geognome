class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: %i[ show edit update destroy ]
  swagger_controller :users, 'Users'

  swagger_api :index do
    summary 'Returns all users'
    notes 'Notes...'
  end

  def index
    @students = Student.all
  end

  # GET /users or /users.json
  def index
    @users = User.all
  end

 swagger_api :show do
    summary 'Returns one user'
    param :path, :id, :integer, :required, "User id"
    notes 'Notes...'
  end
  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  swagger_api :create do
    summary "Create a user"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :form, "user[login]", :string, :required, "User login"
    param :form, "user[password]", :string, :required, "User password"
   end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  swagger_api :update do
    summary "Update a user"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :path, :id, :integer, :required, "Users id"
    param :form, "user[login]", :string, :required, "Users name"
    param :form, "user[password]", :string, :required, "Users password"
  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /users/1 or /users/1.json
  swagger_api :destroy do
    summary 'Destroys a user'
    param :header, "Authorization", :string, :required, "Authentication token"
    param :path, :id, :integer, :required, "User id"
    notes 'Notes...'
  end
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:login, :password, :password_confirmation)
    end
end
