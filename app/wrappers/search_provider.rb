# Public: Encapsulates the search provider used in the project.
class SearchProvider
  def initialize(provider = Sunspot)
    @provider = provider
  end

  def search(models)
    @provider.search(models)
  end
end
