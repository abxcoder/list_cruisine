class Api::V1::Search2Controller < ApiController
    before_action :authorized

    def cari
        # cari = pencarian[:cari]
        @kategori= Kategori.where('name LIKE ?', "%#{pencarian[:cari]}")
        @kategori.count > 0 ? @food = Food.where(kategori_id: @kategori[0].id) : @food = 0
        api = Array.new
        menu = Array.new
        menunya = Array.new
        restonya = Array.new
        resto = Array.new
        restoran = Array.new
        menu_detail = Array.new
        final = Array.new

        if @food.count > 0
            food_id = Array.new
            @food.each_with_index { |food, index| food_id.push(@food[index].id)}

            @m = 0
            while @m < food_id.count do
                menu = Menu.where(food_id: food_id[@m])
                menunya.push(menu)
                menu = []
                @m += 1
            end

            @i = 0
            while @i < menunya.count do
                restonya.push(menunya[@i][0].restoran_id)
                @i += 1
            end

            resto = restonya.uniq

            @u = 0
            while @u < resto.count do
              @rst = Restoran.where(id: resto[@u])
              @e = 0
                while @e < menunya.count do
                  if menunya[@e][0].restoran.id == resto[@u]
                    final.push(
                      "menu_id": menunya[@e][0].id, 
                      "name": menunya[@e][0].name,
                      "harga": menunya[@e][0].harga,
                      "image": menunya[@e][0].image,
                      "created_at": menunya[@e][0].created_at,
                      "updated_at": menunya[@e][0].updated_at
                    )
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
            api.push(keyword: @kategori, result: "data tidak ditemukan")
            render json: { data: api }, status: :ok
        end
    end

    private

    def pencarian
      params.require(:search2).permit(:cari )
    end
end
