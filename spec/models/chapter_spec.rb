require 'rails_helper'

RSpec.describe Chapter, type: :model, mod: true  do
  let(:chapter) { create(:chapter, name: 'Number-1') }

  context 'check validation' do
    it { should validate_presence_of :name }
  end

  context 'check return variables' do
    it 'sould return name chapter' do
      expect(chapter.name).to eq('Number-1')
    end
  end
end
