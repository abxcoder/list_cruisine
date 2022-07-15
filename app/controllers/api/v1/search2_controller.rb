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

            @final_resto = Array.new
            @nama_resto = Array.new
            @nama_menu = Array.new
            @nama_menus = Array.new
            @nama_kategori = Array.new
            @final_kategori = Array.new

            @id_restoran = @menu.pluck(:restoran_id).uniq
            @restoran = Restoran.where(restorans: {id: @id_restoran})

              @rt = 0
              while @rt < @restoran.count do
                @nama_resto.push(@restoran[@rt])

                @mn = 0 
                while @mn < @menu.count do
                  
                  if @restoran[@rt].id == @menu[@mn].restoran_id
                    @nama_menu.push(@menu[@mn])
                    @nama_menus.push(@nama_menu)
                  end

                  @mn += 1
                  @nama_menu = []
                end

                @final_resto.push("restoran": @nama_resto, menu: @nama_menus)
                @rt += 1
                @nama_resto = []
                @nama_menus = []

              end

            render json: { "food": @food,  "final_resto": @final_resto},  status: :ok
            

          else

            api.push(keyword: @kategori, result: "Maaf, menu yang anda cari tidak ditemukan")
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