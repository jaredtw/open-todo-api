class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :list_titles

  def list_titles
    object.list_titles
  end
end
