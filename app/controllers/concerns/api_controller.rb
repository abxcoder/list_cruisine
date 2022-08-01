class ApiController < ActionController::API
    # before_action :authorized, :except => [:login]
    before_action :authorized
    # AUTHENTICATE_USER_EXCEPT_CONTROLLERS = [auth_controller]

  
    def encode_token(payload)
        # should store secret in env variable
        JWT.encode(payload.merge(exp: 5.minutes.from_now.to_i), 'my_s3cr3t')
        
    end

    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']

    end

    def imei_check
        request.headers['imei_number']
    end

    def decoded_token
        if auth_header
        token = auth_header.split(' ')[1]
        
        # header: { 'Authorization': 'Bearer <token>' }
        begin
            JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
        rescue JWT::DecodeError
            nil
        end
        end
    end

    def current_user
        if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
        end
    end
    
    def jwt_compare
        # cari daftar jwt didalam tabel blacklist dengan user id saat ini, dan masukkan dalam daftar array
        jwtblacklist = JwtBlacklist.where(user_id: @user.id).pluck(:jwt).uniq

        # tangkap jwt token yang dikirim lewat header
        @compare = auth_header.split(' ')[1]

        #  apakah @compare bisa ada dalam array jwtblacklist atau tidak
        !@compare.in?(jwtblacklist)
        # jika ada maka nilai akan true lalu kena sign unary (!) sehingga hasilnya akan terbalik

    end

    def imei_compare
        imei_number = params[:imei]
        imei_active = ImeiActive.where(user_id: @user.id).pluck(:number).join("")
        imei_number == imei_active
        # imei_check
        # byebug
    end

   

    def logged_in?
        !!current_user && !!jwt_compare && !! imei_compare
    end

    def authorized
        unless logged_in?
        render json: { message: 'Please log in' }, status: :unauthorized
        end
    end

    # def authenticate_user!
    #     unless AUTHENTICATE_USER_EXCEPT_CONTROLLERS.include?(params[:auth_controller])
    #      super
    #     end
    #   end
end