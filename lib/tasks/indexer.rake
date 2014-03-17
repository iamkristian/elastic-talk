require 'es_talk/indexer'

namespace :indexer do

  desc "Reindexes the ycombinator"
  task index: :environment do
    indexer = EsTalk::Indexer.instance
    item = indexer.index_items(ENV['URL'])
    Item.create(item.to_h)

    item.comments.each do |comment|
      Item.create(comment.to_h)
    end
  end

  task reindex: :environment do
    Item.all.each { |item| item.re_index }
  end
end
