require 'spec_helper'
describe Durian::Page do
  let(:page) { TestPage.new }

  it 'located_at should exists and contain a string object' do
    expect(page.located_at).to exist
    expect(page.located_at).to be_a(String)
  end

  it '[]' do
    expect(page[option]).to exist
  end
end
