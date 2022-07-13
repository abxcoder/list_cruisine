class Search3Controller < ApplicationController
    def food
        # byebug
        # pencarian = params[:search3]
        # pencarian = search_food[:search3]
        # @food = pencarian

        @food= Food.where('name LIKE ?', "%#{params[:search3]}")
    end

    def Kategori
    end

    

end
