class Api::V1::SearchController < ApiController
    before_action :authorized

    def cari
        # cari = pencarian[:cari]
        @food= Food.where('name LIKE ?', "%#{pencarian[:cari]}")
        @food.count > 0 ? @menu = Menu.where( food_id: @food[0].id) : @menu = 0
        

        if @menu != 0
          restonya = Array.new
          final_resto = Array.new
          final = Array.new
          api = Array.new

          @i = 0
          while @i < @menu.count do 
            restonya.push(@menu[@i].restoran.id)
            @i += 1
          end

          final_resto = restonya.uniq

          @u = 0
            while @u < final_resto.count do
              @e = 0
                while @e < @menu.count do
                  if @menu[@e].restoran.id == final_resto[@u]
                    final.push("restoran_id": @menu[@e].restoran.id,
                      "menu_id": @menu[@e].id, 
                      "name": @menu[@e].name,
                      "harga": @menu[@e].harga,
                      "image": @menu[@e].image,
                      "created_at": @menu[@e].created_at,
                      "updated_at": @menu[@e].updated_at
                    )
                  end
                  @e += 1
                end
              @u += 1
            end

          api.push(@food, "count":@menu.count, "status": "success")
         
          api.push(final)
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
