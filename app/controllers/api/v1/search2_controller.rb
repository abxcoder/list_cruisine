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

          if @menu.count > 0
            @nama_resto = Array.new
            @final_resto = Array.new
            @nama_menu = Array.new
            @nama_menus = Array.new
            @nama_kategori = Array.new
            @final_kategori = Array.new

            @id_restoran = @menu.pluck(:restoran_id).uniq
            @restoran = Restoran.where(restorans: {id: @id_restoran})

              @kg = 0
              while @kg < @food.count do
                @nama_kategori.push(@food[@kg])
                @id_kategori = @food[@kg].id 

                @rt = 0
                while @rt < @restoran.count do
                  @nama_resto.push(@restoran[@rt])

                  @mn = 0 
                  while @mn < @menu.count do
                    
                    if @restoran[@rt].id == @menu[@mn].restoran_id && @id_kategori == @menu[@mn].food_id
                      @nama_menu.push(@menu[@mn])
                      @nama_menus.push(@nama_menu)
                    end

                    @mn += 1
                    @nama_menu = []
                  end

                  if @nama_menus.present?
                    @nama_resto.push("menu": @nama_menus)
                    @final_resto.push("restaurant": @nama_resto)
                  end

                  @nama_menus = []
                  @nama_resto = []
                  @rt += 1
                end

                @nama_kategori.push("result": @final_resto)
                @final_kategori.push("kategori": @nama_kategori)
                @kg += 1
                # @nama_resto = []
                @nama_kategori = []
                @final_resto = []
              end

            api.push("status": "success", "kategori": @food.count, "jumlah_restoran": @restoran.count, "jumlah_menu": @menu.count, "result": @final_kategori)

            render json: { data: api},  status: :ok
          else

            api.push(keyword: @kategori, result: "Maaf, Untuk kategori dimaksud belum ada menu yang tersedia saat ini")
            render json: { data: api }, status: :ok
          end

        else

            api.push(keyword: @kategori, result: "Maaf, Kategori yang anda cari tidak ditemukan")
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