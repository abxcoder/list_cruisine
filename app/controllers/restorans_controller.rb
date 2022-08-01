class RestoransController < ApplicationController
  before_action :set_restoran, only: %i[ show edit update destroy ]
  before_action :is_admin, only: %i[ index show new create destroy update edit]

  # GET /restorans or /restorans.json
  def index
    @restorans = Restoran.all
  end

  # GET /restorans/1 or /restorans/1.json
  def show
    @menus = Menu.where(restoran_id: @restoran.id )
  end

  # GET /restorans/new
  def new
    @restoran = Restoran.new
  end

  # GET /restorans/1/edit
  def edit
  end

  # POST /restorans or /restorans.json
  def create
    @restoran = Restoran.new(restoran_params)

    respond_to do |format|
      if @restoran.save
        format.html { redirect_to restoran_url(@restoran), notice: "Restoran was successfully created." }
        format.json { render :show, status: :created, location: @restoran }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restoran.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restorans/1 or /restorans/1.json
  def update
    respond_to do |format|
      if @restoran.update(restoran_params)
        format.html { redirect_to restoran_url(@restoran), notice: "Restoran was successfully updated." }
        format.json { render :show, status: :ok, location: @restoran }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restoran.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restorans/1 or /restorans/1.json
  def destroy
    @restoran.destroy

    respond_to do |format|
      format.html { redirect_to restorans_url, notice: "Restoran was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restoran
      @restoran = Restoran.find(params[:id])
    end

    def is_admin
      if !current_user.admin?
        
        redirect_to root_path
      end
    end

    # Only allow a list of trusted parameters through.
    def restoran_params
      params.require(:restoran).permit(:name, :alamat, :city, :phone, :image )
    end
end
