require 'open-uri'
require 'rest_client'
require 'singleton'
require 'nokogiri'
require 'byebug'
require 'es_talk/item'

module EsTalk
  class Indexer
    include Singleton

    def index_items(url)
      Item.build(doc(url))
    end

    protected

    def doc(url)
      Nokogiri::HTML(open_uri(url), nil, "UTF-8")
    end

    def open_uri(uri)
      open(uri)
    end
  end
end
