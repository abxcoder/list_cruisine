class Api::V1::AuthController < ApiController
    before_action :authorized
  
    def login
      @user = User.find_by(email: user_login_params[:email])
    #   byebug
  
      #User#authenticate comes from BCrypt
      if @user && @user.authenticate(user_login_params[:encrypted_password])
        # encode token comes from ApplicationController
        @token = encode_token(user_id: @user.id )
        # byebug
        render json: {
                 user: ClientSerializer.new(@user),
                 jwt: @token
               },
               status: :ok
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
