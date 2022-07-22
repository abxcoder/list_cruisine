class Api::V1::Search2Controller < ApiController
  before_action :authorized

  def cari
    @kategori = pencarian[:cari].present? ? Kategori.where('name LIKE ?', "%#{pencarian[:cari]}") : []
  end

  private
  def pencarian
    params.require(:search2).permit(:cari )
  end
end