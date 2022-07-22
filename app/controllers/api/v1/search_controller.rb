class Api::V1::SearchController < ApiController
  before_action :authorized

  def cari
    @food = pencarian[:cari].present? ? Food.where('name LIKE ?', "%#{pencarian[:cari]}") : []
  end


  private
  def pencarian
    params.require(:search).permit(:cari )
  end
end