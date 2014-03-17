require 'es_talk'

describe EsTalk::Indexer do

  let(:indexer) { EsTalk::Indexer.instance }
  let(:item) { File.open('spec/fixtures/item.html') }

  context "Item" do
    let(:indexed_item) { indexer.index_items('http://fish') }
    before do
      indexer.stub(:open_uri) { item }
    end

    it "finds an item" do
      indexed_item.should_not be_nil
    end

    it "assigns a user" do
      indexed_item.author.should eq('gebe')
    end

    it "assigns points" do
      indexed_item.points.should eq('338')
    end

    it "assigns an identifier" do
      indexed_item.identifier.should eq('7369999')
    end

    it "assigns a link" do
      indexed_item.link.should eq('http://ghost.teario.com/how-not-to-write-an-api/')
    end

    context "Comments" do
      let(:comments) { indexed_item.comments }
      it "assigns comments" do
        comments.should_not be_empty
      end

      it "finds all comments" do
        byebug
        comments.size.should be(127)
      end

      it "assigns identifier to comment" do
        comments.first.identifier.should eq("7370178")
      end

      it "assigns link to comment" do
        comments.first.link.should eq("item?id=7370178")
      end

      it "assigns author to comment" do
        comments.first.author.should eq("Mithaldu")
      end

      it "assigns parent" do
        comment.first.parent.should eq(indexed_item.identifier)
      end
    end
  end
end
