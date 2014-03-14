require 'es_talk/indexer'

namespace :indexer do

  desc "Reindexes the ycombinator"
  task index: :environment do
    indexer = EsTalk::Indexer.instance
    indexer.index_items(ENV['url'])
  end
end
