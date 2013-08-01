require 'spec_helper'

describe Github::RepoSeach do

  let(:given_query) { 'backbone' }
  let(:search_results) {}

  describe :search do

    let(:search_options) { subject.class.search_options }

    it "searches for Github repositories using Github's API" do
      expect(github_client).to have_received(search_repositories).with(given_query, search_options)
    end

    describe :search_options do
      it 'limits the search to our organization'
    end

  end

  describe :validate_response do

    context 'when the response has result items' do
      it 'parses the result items'
    end

    context 'when the response has no items' do
      it 'returns nothing'
    end

  end

  describe :parse do

    it 'creates a respo search results for the search response items'

    it 'limits the search results to MAX_SEARCH_LIMIT'

  end

end
