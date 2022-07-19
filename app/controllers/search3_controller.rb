class Search3Controller < ApplicationController
    def food
        @pencarian = params[:search3]
        @kategori = Kategori.where('name LIKE ?', "%#{params[:search3]}")
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
                    @cari = @pencarian
                    @id_restoran = @menu.pluck(:restoran_id).uniq
                    @restoran = Restoran.where(restorans: {id: @id_restoran})
                else
                    @cari = @pencarian
                    @result = "Menu tidak ditemukan, silahkan lakukan pencarian dengan kata kunci yang lainnya"
                end
            else
                @cari = @pencarian
                @result = "Kategori tidak ditemukan, silahkan lakukan pencarian dengan kata kunci yang lainnya"
            end
        else
            @cari = @pencarian
            @result = "data tidak ditemukan, silahkan lakukan pencarian dengan kata kunci yang lainnya"
        end
    end
end
