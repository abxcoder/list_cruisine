class Api::V1::AuthController < ApiController
  # skip_before_action: authorized, only: [:login]
  skip_before_action :authorized
    def login
      # byebug
      @user = User.find_by(email: user_login_params[:email])
  
      if @user 
        @token = encode_token(user_id: @user.id )
        time = Time.now + 5.minutes.to_i
        render json: { user: ClientSerializer.new(@user), jwt: @token, exp: time.strftime("%m-%d-%Y %H:%M") }, status: :ok

      else
        render json: {
                 message: 'Invalid username or password',
               },
               status: :unauthorized
      end
    end
  
    private
  
    def user_login_params
      params.require(:user).permit(:email, :encrypted_password)
    end
end
