class ImeiActivesController < ApplicationController
  before_action :set_imei_active, only: %i[ show edit update destroy ]

  # GET /imei_actives or /imei_actives.json
  def index
    @imei_actives = ImeiActive.all
  end

  # GET /imei_actives/1 or /imei_actives/1.json
  def show
  end

  # GET /imei_actives/new
  def new
    @imei_active = ImeiActive.new
  end

  # GET /imei_actives/1/edit
  def edit
  end

  # POST /imei_actives or /imei_actives.json
  def create
    @imei_active = ImeiActive.new(imei_active_params)

    respond_to do |format|
      if @imei_active.save
        format.html { redirect_to imei_active_url(@imei_active), notice: "Imei active was successfully created." }
        format.json { render :show, status: :created, location: @imei_active }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @imei_active.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imei_actives/1 or /imei_actives/1.json
  def update
    respond_to do |format|
      if @imei_active.update(imei_active_params)
        format.html { redirect_to imei_active_url(@imei_active), notice: "Imei active was successfully updated." }
        format.json { render :show, status: :ok, location: @imei_active }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @imei_active.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imei_actives/1 or /imei_actives/1.json
  def destroy
    @imei_active.destroy

    respond_to do |format|
      format.html { redirect_to imei_actives_url, notice: "Imei active was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imei_active
      @imei_active = ImeiActive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def imei_active_params
      params.require(:imei_active).permit(:number, :status, :user_id)
    end
end
