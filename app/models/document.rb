class Document < ActiveRecord::Base
  include Solrsan::Search
  after_save :index
  before_destroy :destroy_index_document

  def as_solr_document
    {:author => author, :content => content}
  end
end
