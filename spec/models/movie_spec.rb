# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has a title' do
    movie = Movie.create!(title: 'Harry Potter', duration: 120)
    expect(movie.title).to eq('Harry Potter')
  end
end
