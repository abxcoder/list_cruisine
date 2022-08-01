class ImeiActiveSerializer < ActiveModel::Serializer
  attributes :id, :number, :status
  has_one :user
end
