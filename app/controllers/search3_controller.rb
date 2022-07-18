class Search3Controller < ApplicationController
    def food

        @kategori = Kategori.where('name LIKE ?', "%#{params[:search3]}")

        @simpul = Array.new

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

                else

                    @result = "Menu tidak ditemukan, silahkan lakukan pencarian dengan kata kunci yang lainnya"

                end


            
            else

                @result = "Kategori tidak ditemukan, silahkan lakukan pencarian dengan kata kunci yang lainnya"

            end


        else

            @result = "data tidak ditemukan, silahkan lakukan pencarian dengan kata kunci yang lainnya"


        end
        
    end

    

    

end
