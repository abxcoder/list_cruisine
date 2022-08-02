class Api::V1::AuthController < ApiController
  # skip_before_action: authorized, only: [:login]
  skip_before_action :authorized

    def login
      @user = User.find_by(email: user_login_params[:email])
      @pass = @user.valid_password?(user_login_params[:encrypted_password])

      # cek imei active berdasarkan user_id
      imeiactive = ImeiActive.where(user_id: @user.id)

      #lalu hapus semua imei yang ada berdasarkan id
      imeiactive.destroy(imeiactive.pluck(:id))

      #cek input imei dari params
      ciidp = user_login_params[:imei]

      if @pass && ciidp.present?
        @token = encode_token(user_id: @user.id )
        time = Time.now + 5.minutes.to_i
        
        # cek apakah ada no token dengan id diatas didalam daftar jwt-active
        # jwtactive = JwtActive.where(user_id: @user.id)
        jwtactive = JwtActive.where(user_id: @user.id)
        @jwt = jwtactive.pluck(:jwt).join("")
        @expired = jwtactive.pluck(:expired).join("")

        #lalu masukkan number imei berdasarkan params
        @imei = imeiactive.new("number": ciidp)

        # save
        @imei.save
                
        # jika ada maka no token tersebut dimasukkan dalam daftar jwt-active
        if jwtactive.present?
          @jwt_blacklist = JwtBlacklist.new("jwt": @jwt, "user_id": @user.id, "expired": @expired)
          @jwt_blacklist.save
          jwtactive.update_all("jwt": @token, "expired": time.strftime("%Y-%m-%d %H:%M"))
        
        # jika tidak ada, artinya user baru login pertama kali, jadi cukup simpan tokennya di jwt-active
        else
          @jwt_actives = JwtActive.new("jwt": @token, "user_id": @user.id, "expired": time.strftime("%Y-%m-%d %H:%M") )
          @jwt_actives.save
        end

        # time = Time.now + 50.minutes.to_i
        render json: { user: ClientSerializer.new(@user), jwt: @token, exp: time.strftime("%Y-%m-%d %H:%M") }, status: :ok

      else
        render json: { message: 'Invalid username or password'}, status: :unauthorized
      end
    end
  
    private
    def user_login_params
      params.require(:user).permit(:email, :encrypted_password, :imei)
    end
end
