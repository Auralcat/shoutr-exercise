class Search
  attr_reader :term
  alias :results :run

  def initialize(term:)
    @term = term
  end

  def run
    # SearchProvider.new.search([TextShout, PhotoShout]) { fulltext term }.results
    ShoutSearchQuery.new(term: term).to_relation
  end
end
