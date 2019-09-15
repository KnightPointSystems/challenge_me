class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @task_schedules = @user.task_schedules.order(:due_date)
    @tasks          = @user.tasks.order(:due_date)

    if params[:view] == 'today'
      # Use Time.now.utc so that if @user.time_zone is nil, it defaults to the current UTC time
      cur_local_time = Time.now.utc.in_time_zone(@user.time_zone)
      # To the local user, due date being "today" means that the due date time is between 00:00:00 and 23:59:59 of
      # the current day in local time, hence the use of the methods #beginning_of_day and #end_of_day. Then,
      # we need to convert the two to UTC times since the "due_date" column in the database tables are in UTC time
      cur_utc_beginning_of_day_time = cur_local_time.beginning_of_day.utc
      cur_utc_end_of_day_time       = cur_local_time.end_of_day.utc

      @task_schedules = @task_schedules.due_between(cur_utc_beginning_of_day_time, cur_utc_end_of_day_time)
      @tasks          = @tasks.due_between(cur_utc_beginning_of_day_time, cur_utc_end_of_day_time)
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :time_zone)
    end
end
