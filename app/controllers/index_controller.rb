require 'es_talk/indexer'
class IndexController < ApplicationController

  def index
    indexer = EsTalk::Indexer.instance
    @item = indexer.index_items(params[:url])
    Item.create(@item)
  end
end
