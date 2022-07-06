class Api::V1::SearchController < ApiController
    before_action :authorized

    def cari
        # cari = pencarian[:cari]\
        @food= Food.where('name LIKE ?', "%#{pencarian[:cari]}")

        if @food.count > 0

          @menu = Menu.where( food_id: @food[0].id)

          # jika menu kosong?, masukkan kondisi dan presnt api khusus menu kosong
          restonya = Array.new
          restonya2 = Array.new
          final_resto = Array.new
          final = Array.new
          api = Array.new

          @i = 0
          while @i < @menu.count do 
            restonya.push(@menu[@i].restoran.id)
            restonya2.push("we have #{@i}")
            @i = @i + 1
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
              @e = @e + 1
            end
            @u = @u + 1
          end

          api.push(@food)
          api.push("count":@menu.count)
          api.push("status": "success")
          api.push(final)


          render json: { result: api  }, status: :ok
        
        else

          render json: { result: "data yang anda cari tidak ditemukan" }, status: :ok

        end

        
    end

    private

    def pencarian
      params.require(:search).permit(:cari )
    end
end
