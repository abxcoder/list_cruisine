class ClientSerializer < ActiveModel::Serializer
  attributes :email, :admin, :premium, :user
end
