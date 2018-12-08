require 'rails_helper'

RSpec.describe 'Stats API' do
  let!(:trip) { create(:trip) }
  let!(:stats) { create_list(:stat, 20, trip_id: trip.id) }
  let(:trip_id) { trip.id }
  let(:id) { stats.first.id }

  describe 'GET /trips/:trip_id/stats' do
    before { get "/trips/#{trip_id}/stats" }

    context 'when trip exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all trip stats' do
        expect(json.size).to eq(20)
      end
    end

    context 'when trip does not exist' do
      let(:trip_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Trip/)
      end
    end
  end

  describe 'GET /trips/:trip_id/stats/:id' do
    before { get "/trips/#{trip_id}/stats/#{id}" }

    context 'when trip stat exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the stat' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when trip stat does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Stat/)
      end
    end
  end

  describe 'POST /trips/:trip_id/stats' do
    let(:valid_attributes) { { max_speed: '85', distance: "5643" } }

    context 'when request attributes are valid' do
      before { post "/trips/#{trip_id}/stats", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/trips/#{trip_id}/stats", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Max speed can't be blank, Distance can't be blank/)
      end
    end
  end

  describe 'PUT /trips/:trip_id/stats/:id' do
    let(:valid_attributes) { { max_speed: '70' } }

    before { put "/trips/#{trip_id}/stats/#{id}", params: valid_attributes }

    context 'when stat exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the stat' do
        updated_stat = Stat.find(id)
        expect(updated_stat.max_speed).to match(/70/)
      end
    end

    context 'when the stat does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Stat/)
      end
    end
  end

  describe 'DELETE /trips/:id' do
    before { delete "/trips/#{trip_id}/stats/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
