class KategorisController < ApplicationController
  before_action :set_kategori, only: %i[ show edit update destroy ]

  # GET /kategoris or /kategoris.json
  def index
    @kategoris = Kategori.all
  end

  # GET /kategoris/1 or /kategoris/1.json
  def show
  end

  # GET /kategoris/new
  def new
    @kategori = Kategori.new
  end

  # GET /kategoris/1/edit
  def edit
  end

  # POST /kategoris or /kategoris.json
  def create
    @kategori = Kategori.new(kategori_params)

    respond_to do |format|
      if @kategori.save
        format.html { redirect_to kategori_url(@kategori), notice: "Kategori was successfully created." }
        format.json { render :show, status: :created, location: @kategori }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kategori.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kategoris/1 or /kategoris/1.json
  def update
    respond_to do |format|
      if @kategori.update(kategori_params)
        format.html { redirect_to kategori_url(@kategori), notice: "Kategori was successfully updated." }
        format.json { render :show, status: :ok, location: @kategori }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kategori.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kategoris/1 or /kategoris/1.json
  def destroy
    @kategori.destroy

    respond_to do |format|
      format.html { redirect_to kategoris_url, notice: "Kategori was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kategori
      @kategori = Kategori.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kategori_params
      params.require(:kategori).permit(:name, :jenis, :origin)
    end
end
