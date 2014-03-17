require 'es_talk/indexer'
require 'elastic'
class IndexController < ApplicationController

  def index
    es = Elastic.instance
    @health = es.client.cluster.health
    query = params[:query] || "nice"
    result = es.search( query: { match: { content: query }},
                facets: { tags: { terms: { field: 'author' } }} )
    @authors = result["facets"]["tags"]["terms"].map
    @hits = result["hits"]["total"]
    @result = result["hits"]["hits"]
  end
end
