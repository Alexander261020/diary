require 'rails_helper'

RSpec.describe Block, type: :model do
  let(:name) { "simple name" }
  let(:block) { build(:block) }

  it 'must return content' do
    expect(block.content).to eq('factories content for medel block')
  end

  it 'must return comment' do
    expect(block.comment).to eq('factories comment for medel block')
  end

  it 'must return link' do
    expect(block.link).to eq('factories link for medel block')
  end
end
