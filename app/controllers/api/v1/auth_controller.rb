class Api::V1::AuthController < ApiController
  # skip_before_action: authorized, only: [:login]
  skip_before_action :authorized

    def login
      # byebug
      @user = User.find_by(email: user_login_params[:email])
  
      if @user 
        @token = encode_token(user_id: @user.id )
        
        # cek apakah ada no token dengan id diatas didalam daftar jwt-active
        jwtactive = JwtActive.where(user_id: @user.id).select("jwt")
        @jwt = jwtactive.pluck(:jwt).join("")
        
        
        # byebug
        
        # jika ada maka no token tersebut dimasukkan dalam daftar jwt-active
        if jwtactive.present?
          @jwt_blacklist = JwtBlacklist.new("jwt": @jwt, "user_id": @user.id)
          @jwt_blacklist.save
          JwtActive.where("user_id": @user.id).limit(1).update_all("jwt": @token)
          
        # jika tidak ada, artinya user baru login pertama kali, jadi cukup simpan tokennya di jwt-active
        else
          @jwt_actives = JwtActive.new("jwt": @token, "user_id": @user.id)
          @jwt_actives.save
        end

        time = Time.now + 50.minutes.to_i
        render json: { user: ClientSerializer.new(@user), jwt: @token, exp: time.strftime("%m-%d-%Y %H:%M") }, status: :ok

      else
        render json: { message: 'Invalid username or password'}, status: :unauthorized
      end
    end
  
    private
  
    def user_login_params
      params.require(:user).permit(:email, :encrypted_password)
    end
end
