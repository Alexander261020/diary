require 'rails_helper'

RSpec.describe Subsection, type: :model do
  # без этой строки выдает ошибку
  let(:name) {}

  context 'validations check' do
    it { should validate_presence_of :name }
  end

  context 'return values' do
    let(:subsection) { FactoryBot.create(:subsection) }

    it 'should return name' do
      expect(subsection.name).to eq('Sub-1')
    end

    it 'should retunr object Chapter' do
      expect(subsection.chapter).to be_an(Chapter)
    end
  end
end
