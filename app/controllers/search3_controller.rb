class Search3Controller < ApplicationController
    def food
        if params[:search3] != ""
            @pencarian = params[:search3]
            @kategori = Kategori.where('name LIKE ?', "%#{params[:search3]}")
            if @kategori.present?
                @food = Food.where(kategori_id: @kategori[0].id)
                if @food.present?
                    @id_food = Food.where(kategori_id: @kategori[0].id).pluck(:id)
                    @menu = Menu.where(menus: {food_id: @id_food})
                    if @menu.present?
                        
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
        else
            @cari = @pencarian
            @result = "data pencarian tidak boleh kosong"
        end
    end
end
