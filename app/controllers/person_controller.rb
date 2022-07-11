class PersonController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def create
    @person = User.new
  end

  def register
    @person = User.new(person_params)
    if @person.save
      respond_to do |format|
        format.html { redirect_to persons_path, notice: "Person was registered." }
        format.json { head :no_content }
      end
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to persons_path, notice: "Person was destroyed." }
      format.json { head :no_content }
    end
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
      params.require(:user).permit(:email, :password, :admin, :premium, :user, :encrypted_password)
    end

end
