require 'rails_helper'

RSpec.describe 'Trips API', type: :request do
  let!(:trips) { create_list(:trip, 10) }
  let(:trip_id) { trips.first.id }

  describe 'GET /trips' do
    before { get '/trips' }

    it 'returns trips' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /trips/:id' do
    before { get "/trips/#{trip_id}" }

    context 'when the record exists' do
      it 'returns the trip' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(trip_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:trip_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Trip/)
      end
    end
  end

  describe 'POST /trips' do
    let(:valid_attributes) { { trip_id_number: '4593456', start: '145', stop: '345', status: "completed", vehicleId: '1092834576', deviceId: '98273' } }

    context 'when the request is valid' do
      before { post '/trips', params: valid_attributes }

      it 'creates a trip' do
        expect(json['trip_id']).to eq('4593456')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/trips', params: { trip_id_number: 'invalid_request' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Start can't be blank, Stop can't be blank, Status can't be blank, Vehicleid can't be blank, Deviceid can't be blank/)
      end
    end
  end

  describe 'PUT /trips/:id' do
    let(:valid_attributes) { { trip_id_number: '9827364' } }

    context 'when the record exists' do
      before { put "/trips/#{trip_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /trips/:id' do
    before { delete "/trips/#{trip_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
