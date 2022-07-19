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

    def logged_in?
        !!current_user
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