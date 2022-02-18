require 'rails_helper'

RSpec.describe ChaptersController, type: :controller do
=begin   # не понятно для чего вообще нужна
  let(:name) { "simple name" }
  # создаем раздел
  let(:chapter) { Chapter.create(name: 'SOS') }

  context 'check status' do
    it '#show sould status 200' do
      # вызываем экшен
      get :show, id: chapter.id
      expect(response.status).to eq(200)
    end
  end
=end
end
