class Api::V1::SearchController < ApiController
    before_action :authorized

    def cari
        # cari = pencarian[:cari]
        @food= Food.where('name LIKE ?', "%#{pencarian[:cari]}")
        render json: { result: @food}, status: :accepted
    end

    private

    def pencarian
      params.require(:search).permit(:cari )
    end
end
