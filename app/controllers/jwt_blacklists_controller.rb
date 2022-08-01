class JwtBlacklistsController < ApplicationController
  before_action :set_jwt_blacklist, only: %i[ show edit update destroy ]

  # DELETE /jwt_blacklists/1 or /jwt_blacklists/1.json
  def destroy

    respond_to do |format|
      if @jwt_blacklist.destroy
        format.html { redirect_to "/persons/#{@jwt_blacklist.user_id}/detail", notice: "Jwt blacklist was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jwt_blacklist.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jwt_blacklist
      @jwt_blacklist = JwtBlacklist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jwt_blacklist_params
      params.require(:jwt_blacklist).permit(:jwt, :user_id)
    end
end
