class Api::V1::Search2Controller < ApiController
  before_action :authorized

  def cari
      @kategori= Kategori.where('name LIKE ?', "%#{pencarian[:cari]}")

      api = Array.new

      if @kategori.count > 0

        @food = Food.where(kategori_id: @kategori[0].id)

        if @food.count > 0

          @id_food = Food.where(kategori_id: @kategori[0].id).pluck(:id)
          @menu = Menu.where(menus: {food_id: @id_food})
          @id_restoran = @menu.pluck(:restoran_id).uniq
          @restoran = Restoran.where(restorans: {id: @id_restoran})


          render json: { "Kategori": @food, "id": @id_food, menunya: @menu, id_restoran: @id_restoran, restoran: @restoran}, status: :ok

        else

            api.push(keyword: @kategori, result: "Maaf, menu yang anda cari tidak ditemukan")
            render json: { data: api }, status: :ok

        end

      else

          api.push( result: "Maaf, keyword yang anda cari tidak ditemukan", 'status': "failed" )
          render json: { data: api }, status: :ok

      end

  end

  private

  def pencarian
    params.require(:search2).permit(:cari )
  end
end