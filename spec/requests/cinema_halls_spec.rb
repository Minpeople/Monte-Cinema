# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cinema Hall requests', type: :request do
  describe 'GET /cinema_halls' do
    let!(:cinema_hall_1) { create :cinema_hall}
    let!(:cinema_hall_1) { create :cinema_hall }

    before { get('/cinema_halls') }
    it 'returns status 200' do
      expect(response.status).to eq(200)
    end
  end
end
