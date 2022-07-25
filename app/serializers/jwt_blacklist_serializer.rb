class JwtBlacklistSerializer < ActiveModel::Serializer
  attributes :id, :jwt
  has_one :user
end
