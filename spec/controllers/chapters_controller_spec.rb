require 'rails_helper'

RSpec.describe ChaptersController, type: :controller, con: true do
  render_views

  let(:chapter) { create(:chapter) }

  context 'checking actions' do
    it 'check #index' do
      get :index
      expect(response.status).to eq(200)
      # Проверяем рендерится ли шаблон show (НЕ сам шаблон!)
      expect(response).to render_template('index')
    end

    it 'check #show' do
      get :show, params: {id: chapter.id}
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end

    it 'check #new' do
      get :new
      expect(response.status).to eq(200)
      # дложен содержать тег h1 "Создать раздел"
      expect(response.body).to match /<h1>Создать раздел<\/h1>/
    end

    it 'check #create' do
      post :create, params: {chapter: {name: 'chapter-1' } }
      expect(response.status).to eq(302)
    end

    it 'check #edit' do
      get :edit, params: {id: chapter.id}
      expect(response.status).to eq(200)
      expect(response.body).to match /<h1>Редактировать #{chapter.name}<\/h1>/
    end

    it 'check #update' do
      patch :update, params: {id: chapter.id, chapter: {name: 'chapter-222'}}
      expect(response.status).to eq(302)
    end

    it 'check #destroy' do
      delete :destroy, params: {id: chapter.id}
      expect(response.status).to eq(302)
    end
  end
end
