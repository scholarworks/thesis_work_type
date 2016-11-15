class Thesis < ActiveFedora::Base
  include ::CurationConcerns::WorkBehavior
  include ::CurationConcerns::BasicMetadata
  include Sufia::WorkBehavior
  self.human_readable_type = 'Thesis'
  self.human_readable_type = 'Thesis'
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your thesis must have a title.' }

  property :genre, predicate: ::RDF::Vocab::DC.type do |index|
    index.as :stored_searchable
  end

  property :coverage, predicate: ::RDF::Vocab::DC.coverage do |index|
    index.as :stored_searchable, :facetable
  end

  property :sponsorship, predicate: ::RDF::Vocab::DC.description do |index|
    index.as :stored_searchable, :facetable
  end

  property :alt_title, predicate: ::RDF::Vocab::DC.alternative do |index|
    index.as :stored_searchable
  end

  property :committeemember, predicate: ::RDF::Vocab::DC.contributor do |index|
    index.as :stored_searchable, :facetable
  end


  property :provenance, predicate: ::RDF::Vocab::DC.provenance
  property :date_accessioned, predicate: ::RDF::Vocab::DC.dateAccepted, multiple: false

end
