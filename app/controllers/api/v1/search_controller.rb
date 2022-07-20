class Api::V1::SearchController < ApiController
  before_action :authorized

  def cari
      @food= Food.where('name LIKE ?', "%#{pencarian[:cari]}")

      api = Array.new

      @food.count > 0 ? @menu = Menu.where( food_id: @food[0].id) : @menu = 0
      

      if @menu != 0

        @restoran = Array.new
        @nama_kategori = Array.new
        @final_kategori = Array.new
        @nama_menu = Array.new
        @nama_menus = Array.new
        @final_resto = Array.new
        @nama_resto = Array.new

        @id_resto = @menu.pluck(:restoran_id).uniq
        @restoran = Restoran.where(restorans: {id: @id_resto})

          
        @kg = 0
        while @kg < @food.count do
          @nama_kategori.push(@food[@kg])
          @id_kategori = @food[@kg].id 

          @u = 0
          while @u < @restoran.count do
            @nama_resto.push(@restoran[@u])

            @e = 0
              while @e < @menu.count do
                if @menu[@e].restoran_id == @restoran[@u].id && @id_kategori == @menu[@e].food_id
                  @nama_menu.push(@menu[@e])
                  @nama_menus.push(@nama_menu)
                end
                @e += 1
                @nama_menu = []
              end
            if @nama_menus.present?
              @nama_resto.push("menu": @nama_menus)
              @final_resto.push("restaurant": @nama_resto)
            end

            @nama_menus = []
            @nama_resto = []
            @u += 1

          end
          @nama_kategori.push("result": @final_resto)
          @final_kategori.push("kategori": @nama_kategori)
          @kg += 1
          @nama_kategori = []
          @final_resto = []
        end
        api.push("status": "success","kategori": @food.count, "restaurant": @restoran.count, "menu": @menu.count, "result": @final_kategori )
        render json: { data: api  }, status: :ok
      else
        api = Array.new
        api.push("result": "data Yang anda cari tidak ditemukan", "status": "failed")
        render json: { data: api }, status: :ok
      end
  end
  private
  def pencarian
    params.require(:search).permit(:cari )
  end
end