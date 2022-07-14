class Api::V1::Search2Controller < ApiController
  before_action :authorized

  def cari
      @kategori= Kategori.where('name LIKE ?', "%#{pencarian[:cari]}")

      api = Array.new

      if @kategori.count > 0

        @food = Food.where(kategori_id: @kategori[0].id)

        menu = Array.new
        menunya = Array.new
        restonya = Array.new
        resto = Array.new
        restoran = Array.new
        menu_detail = Array.new
        final = Array.new

        if @food.count > 0

            food_id = Array.new
            @food.each_with_index { |food, index| 
              food_id.push(@food[index].id)
            }

            @m = 0
            while @m < food_id.count do
                menu = Menu.where(food_id: food_id[@m])
                # jika menu kosong, harus ditambahkan kondisi 
                menunya.push(menu)
                menu = []
                @m += 1
            end

            if menunya.count > 0 

              @i = 0
              while @i < menunya.count do
                  @s = 0
                  while @s < menunya[@i].count do
                    restonya.push(menunya[@i][@s].restoran_id)
                    @s += 1
                  end
                  @i += 1
              end

              resto = restonya.uniq

              @u = 0
              while @u < resto.count do
                @rst = Restoran.where(id: resto[@u])
                @e = 0
                  while @e < menunya.count do
                    @x = 0
                    while @x < menunya[@e].count do
                      if menunya[@e][@x].restoran.id == resto[@u]
                        final.push(
                          "menu_id": menunya[@e][@x].id,
                          "name": menunya[@e][@x].name,
                          "harga": menunya[@e][@x].harga,
                          "image": menunya[@e][@x].image,
                          "food_id": menunya[@e][@x].food_id,
                          "created_at": menunya[@e][@x].created_at,
                          "updated_at": menunya[@e][@x].updated_at
                        )
                      end
                      @x += 1
                    end
                    @e += 1
                  end
                menu_detail.push( final)
                restoran.push("restoran": @rst, "menu": menu_detail)
                menu_detail = []
                final = []
                @u += 1
              end

              api.push("keyword": @food, "restaurant": resto.count, "menu": menunya.count, "status": "success", "result": restoran )
              render json: { data: api  }, status: :ok

            else
              api.push( result: "Maaf, Menu yang anda cari tidak ditemukan", 'status': "failed" )
              render json: { data: api }, status: :ok
            end

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