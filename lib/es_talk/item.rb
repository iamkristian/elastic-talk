require 'byebug'
module EsTalk
  class Item
    attr_reader :content, :link, :identifier, :author, :comments, :parent, :points

    def initialize(values = {})
      @identifier = values[:identifier]
      @content = values[:content]
      @link = values[:link]
      @author = values[:author]
      @comments = values[:comments]
      @parent = values[:parent]
      @points = values[:points]
    end

    def self.build(page)
      item = {}
      title_elem = page.css('tr .title a')
      item[:content] = title_elem.text.strip
      item[:link] = title_elem.attr('href').value
      subtext_elem = page.css('tr .subtext')
      item[:points] = subtext_elem.children.first.text.split.first
      item[:identifier] = subtext_elem.children[0].attr('id').split('_').last
      item[:author] = subtext_elem.children[2].text
      item[:comments] = extract_comments(page, item[:identifier])
      Item.new(item)
    end

    def to_s
      values = {}
      instance_variables.map { |v| values[v] = instance_variable_get(v) }
      values
    end

    def to_h
      {
        identifier: @identifier,
        content: @content,
        link: @link,
        author: @author,
        parent: @parent,
        points: @points
      }
    end

    private

    def self.extract_comments(page, parent)
      result = []
      page.css('tr .default').each do |element|
        item = {}
        item[:parent] = parent
        item[:author]= element.css('.comhead a').first.text
        item[:link] = element.css('.comhead a').last.attr('href')
        item[:identifier] = item[:link].split('=').last
        item[:content] = element.css('.comment').text
        result << Item.new(item)
      end
      result
    end
  end
end
