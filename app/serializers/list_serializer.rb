class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :permissions, :items
end
