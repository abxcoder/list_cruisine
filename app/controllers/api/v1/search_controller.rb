class Api::V1::SearchController < ApiController
    before_action :authorized

    def cari
        # cari = pencarian[:cari]\
        @food= Food.where('name LIKE ?', "%#{pencarian[:cari]}")

        if @food.count > 0
          @menu = Array.new
          @resto_id = Array.new

        


          @menu = Menu.where( food_id: @food[0].id)
        
          render json: { result: @food, menu: @menu, coba: @resto_id }, status: :ok
        end

        
    end

    private

    def pencarian
      params.require(:search).permit(:cari )
    end
end
