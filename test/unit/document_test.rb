require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  def setup
    @doc = Document.create(:author => "tommy", :content => "solr lucene java scala")
  end

  def teardown
    @doc.destroy if @doc.persisted?
  end

  test "Query works" do
    response = Document.search(:q => "solr")
    results = response[:docs]

    assert !results.select{|r| r['content'].include?("solr")}.empty?
  end
end
