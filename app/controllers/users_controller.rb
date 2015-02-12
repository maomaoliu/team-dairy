class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :like]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    add_one_like(@user)
    respond_to { |format| format.json { render json: @user.like } }
  end

  def like_by_name
    search_name = "%#{params[:user_name]}%"
    users = User.where('name LIKE ?', search_name)
    if users.count == 1
      user = users.take
      add_one_like(user)
      render json: { id: user.id, like: user.like }.to_json
    elsif users.count == 0
      render json: {error: "user #{params[:user_name]} not found."}.to_json
    else
      render json: {error: 'multiple users.', users: users.map(&:name)}.to_json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :like)
    end

    def add_one_like(user)
      user.like = user.like + 1
      user.save
    end
end
