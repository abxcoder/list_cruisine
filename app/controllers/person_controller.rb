class PersonController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    render :edit
    
  end

  # PATCH/PUT /menus/1 or /menus/1.json
  def update
    # byebug
    @user = User.find(params[:id])
    if @user.update(person_params)
      redirect_to persons_url(@person)
      # flash[:success] = "To-do item successfully updated!"
    else
      # flash.now[:error] = "To-do item update failed"
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:user).permit(:email, :admin, :premium, :user)
    end

end
