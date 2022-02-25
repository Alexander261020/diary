require 'rails_helper'

RSpec.describe Chapter, type: :model do
  # без этой строки выдает ошибку
  let(:name) {}

  context 'validations check' do
    it { should validate_presence_of :name }
  end

  context 'check return name' do
    let(:chapter1) { FactoryBot.create(:chapter) }

    it 'sould return name chapter' do
      expect(chapter1.name).to eq('Number-1')
    end
  end
end
