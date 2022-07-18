class Api::V1::AuthController < ApiController
  # skip_before_action: authorized, only: [:login]
  skip_before_action :authorized
    def login
      # byebug
      @user = User.find_by(email: user_login_params[:email])
  
      #User#authenticate comes from BCrypt
      if @user 
        # byebug
        # && @user.authenticate(user_login_params[:encrypted_password])

        @token = encode_token(user_id: @user.id )
        time = Time.now + 1.minutes.to_i
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
      # params { user: {username: 'Chandler Bing', password: 'hi' } }
      params.require(:user).permit(:email, :encrypted_password)
    end
end


# token di login diapadamkan