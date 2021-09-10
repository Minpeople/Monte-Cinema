# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie requests', type: :request do
  describe 'GET /movies' do
    let!(:movie_1) { create :movie }
    let!(:movie_2) { create :movie }

    before { get('/movies') }
    it 'returns status 200' do
      expect(response.status).to eq(200)
    end

    it 'returns correct number of movies' do
      expect(JSON.parse(response.body).count).to eq(2)
    end
  end
end
