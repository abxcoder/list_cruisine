class PersonController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:user).permit(:email)
    end
end
