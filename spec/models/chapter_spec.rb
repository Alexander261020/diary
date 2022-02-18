require 'rails_helper'

RSpec.describe Chapter, type: :model do
  let(:name) { "simple name" }
  
  it 'return name chapter' do
    chapter = build(:chapter, name: 'Sos')
    expect(chapter.name).to eq 'Sos'
  end
end
