class JwtActivesController < ApplicationController
  before_action :set_jwt_active, only: %i[ destroy ]

  # DELETE /jwt_actives/1 or /jwt_actives/1.json
  def destroy
    # pindahkan ke table jwt blacklist jika jwt masih mempunyai masa expired yang active
    if @jwt_active.expired > Time.utc(*Time.now.to_a) 
      @jwt_blacklist = JwtBlacklist.new("jwt": @jwt_active.jwt, "user_id": @jwt_active.user_id, "expired": @jwt_active.expired)
      @jwt_blacklist.save
    end

    respond_to do |format|
      if @jwt_active.destroy
        format.html { redirect_to "/persons/#{@jwt_active.user_id}/detail", notice: "Jwt active was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jwt_active.errors, status: :unprocessable_entity }
      end
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
