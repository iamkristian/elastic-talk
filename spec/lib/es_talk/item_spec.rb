require 'es_talk/item'

describe EsTalk::Item do

  let(:values) do
    {
      identifier: "1234",
      content: "This is a story about a horny pony called unicorn.",
      link: "http://example.com",
      author: "The boogye man",
      parent: nil,
      points: "123"
    }
  end
  let(:comments) { [values, values, values] }

  before do

  end

  context "#to_s" do
    let(:item) { EsTalk::Item.new(values) }

    it "renders a proper to_s" do
      item.to_s.should_not be_nil
    end
  end
end
