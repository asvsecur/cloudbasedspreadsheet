class DataController < ApplicationController
  before_filter :find_user, only: [:index,:new, :edit, :update, :create, :show, :destroy, :download]
  before_action :set_datum, only: [:show, :edit, :update, :destroy, :download]
  before_action :check_permissions, only: [:new, :show, :edit, :update, :destroy, :create]
  # GET /data
  # GET /data.json
  def index
    if @user.admin?
      @data = Datum.all
    else
      accessible_datum_ids = @user.accessible_datum
      @data = Datum.where(id:accessible_datum_ids)
      puts @data.count
    end
  end

  # GET /data/1
  # GET /data/1.json
  def show
  end

  # GET /data/new
  def new
    @datum = Datum.new
  end

  # GET /data/1/edit
  def edit
  end

  # POST /data
  # POST /data.json
  def create
    @datum = Datum.new(datum_params)
    respond_to do |format|
      if @datum.save
        format.html { redirect_to user_data_path(@user), notice: 'Datum was successfully created.' }
        format.json { render :show, status: :created, location: @datum }
      else
        format.html { render :new }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data/1
  # PATCH/PUT /data/1.json
  def update
    respond_to do |format|
      if @datum.update(datum_params)
        format.html { redirect_to user_datum_path(@user, @datum), notice: 'Datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @datum }
      else
        format.html { render :edit }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data/1
  # DELETE /data/1.json
  def destroy
    @datum.destroy
    respond_to do |format|
      format.html { redirect_to user_data_path(@user), notice: 'Datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    send_file @datum.file.path, :type => 'application/xls', :filename => @datum.file_file_name, :x_sendfile=>true
  end

  def find_user
    @user ||= User.find(params[:user_id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_datum
      @datum = Datum.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def datum_params
    data_params = params.require(:datum).permit(:name, :file, :user_id, :title, :firstname, :surname, :address, :email, :telephone, :amount, :entry_date, :anniversary_date_1, :anniversary_date_2, :anniversary_date_3, :interest_amount, :trailer_comm, :initial_comm, :pensionor_cash, :maturity_date)
    data_params.merge({user_id: @user.id})
  end

  def check_permissions
    datum_id = params[:id]
    unless @user.admin?
      redirect_to access_denied_index_path unless @user.accessible_datum.compact.include?(datum_id)
    end
  end
end
