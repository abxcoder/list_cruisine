class Api::V1::ClientsController < ApiController
    skip_before_action :authorized, only: %i[ detail ]

    def profile
      
        render json: { user: ClientSerializer.new(current_user) }, status: :accepted
      
    end

    def detail
      @user = User.find(params[:id])
      @token = encode_token(user_id: @user.id)
      render json: { jwt: @token, user: @user }, status: :accepted
      # redirect_to detailed_member_path(@post)
      # render url: "clients/detail", locals: { token: @token }

    end

    private
  
    def user_params
      params.require(:user).permit(:email, :encrypted_password)
    end
end
