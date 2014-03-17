require 'elastic'
class Item < ActiveRecord::Base
  def re_index
    elastic = Elastic.instance
    body = ItemSerializer.new(self).to_json
    elastic.add_item(body)
  end
end
