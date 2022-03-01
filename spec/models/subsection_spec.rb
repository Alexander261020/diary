require 'rails_helper'

RSpec.describe Subsection, type: :model, mod: true  do
  context 'validations check' do
    it { should validate_presence_of :name }
  end

  context 'return values' do
    let(:subsection) { create(:subsection) }

    it 'should return name' do
      expect(subsection.name).to eq('Sub-1')
    end

    it 'should retunr object Chapter' do
      expect(subsection.chapter).to be_an(Chapter)
    end
  end
end
