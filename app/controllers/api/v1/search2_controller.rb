class Api::V1::Search2Controller < ApiController
    before_action :authorized

    def cari
        # cari = pencarian[:cari]
        @kategori= Kategori.where('name LIKE ?', "%#{pencarian[:cari]}")
        @food = Food.where( kategori_id: @kategori[0].id)
        if @food 
            @rest = @food[0].id
            @resto = Restoran.where(id: @rest)
        else
            @resto = "blank"
        end
        render json: { result: @kategori, menu: @food, resto: @resto }, status: :ok

    end

    private

    def pencarian
      params.require(:search2).permit(:cari )
    end
end
