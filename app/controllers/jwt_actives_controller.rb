class JwtActivesController < ApplicationController
  before_action :set_jwt_active, only: %i[ show edit update destroy ]

  # GET /jwt_actives or /jwt_actives.json
  def index
    @jwt_actives = JwtActive.all
  end

  # GET /jwt_actives/1 or /jwt_actives/1.json
  def show
  end

  # GET /jwt_actives/new
  def new
    @jwt_active = JwtActive.new
  end

  # GET /jwt_actives/1/edit
  def edit
  end

  # POST /jwt_actives or /jwt_actives.json
  def create
    @jwt_active = JwtActive.new(jwt_active_params)

    respond_to do |format|
      if @jwt_active.save
        format.html { redirect_to jwt_active_url(@jwt_active), notice: "Jwt active was successfully created." }
        format.json { render :show, status: :created, location: @jwt_active }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jwt_active.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jwt_actives/1 or /jwt_actives/1.json
  def update
    respond_to do |format|
      if @jwt_active.update(jwt_active_params)
        format.html { redirect_to jwt_active_url(@jwt_active), notice: "Jwt active was successfully updated." }
        format.json { render :show, status: :ok, location: @jwt_active }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jwt_active.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jwt_actives/1 or /jwt_actives/1.json
  def destroy
    # pindahkan ke table jwt blacklist jika jwt masih mempunyai masa expired yang active
    if @jwt_active.expired > Time.utc(*Time.now.to_a) 
      @jwt_blacklist = JwtBlacklist.new("jwt": @jwt_active.jwt, "user_id": @jwt_active.user_id, "expired": @jwt_active.expired)
      @jwt_blacklist.save
    end

    @jwt_active.destroy

    # @link = "/persons/" @jwt_active.user_id "/detail"



    respond_to do |format|
      # format.html { redirect_to persons_path, notice: "Jwt active was successfully destroyed." }
      format.html { redirect_to "/persons/#{@jwt_active.user_id}/detail", notice: "Jwt active was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jwt_active
      @jwt_active = JwtActive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jwt_active_params
      params.require(:jwt_active).permit(:jwt, :user_id)
    end
end
