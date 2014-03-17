require 'elasticsearch'

class Elastic
  include Singleton

  def create_index(name, type, body)
    client.index index: name, type: type, body: body
  end

  def add_item(body)
    create_index('ycombinator', 'items', body)
  end

  def delete_mapping(index, type)
    client.indices.delete_mapping index: index, type: type
  end

  # es.search( query: { match: { content: 'nice' }}, facets: { tags: { terms: { field: 'author' } }} )[:facets]
  def search(options = {})
    client.search(index: 'ycombinator', type: 'items', body: options)
  end

  def client
    Elasticsearch::Client.new log: true
  end
end
