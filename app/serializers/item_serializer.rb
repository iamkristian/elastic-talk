class ItemSerializer < ActiveModel::Serializer
  self.root = false
  attributes :identifier, :author, :content, :link, :points, :parent
end
