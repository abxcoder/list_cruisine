class Api::V1::SearchController < ApiController
    before_action :authorized

    def cari
        # cari = pencarian[:cari]
        @food= Food.where('name LIKE ?', "%#{pencarian[:cari]}")
        @menu = Menu.where( food_id: @food[0].id)
        render json: { result: @food, menu: @menu }, status: :ok
    end

    private

    def pencarian
      params.require(:search).permit(:cari )
    end
end
