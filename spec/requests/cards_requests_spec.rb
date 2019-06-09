require 'rails_helper'

describe 'Todos API', type: :request do
  # initialize test data
  let(:team) { create(:team) }
  let(:employee1) { create(:employee, team: team) }
  let(:employee2) { create(:employee, team: team) }
  let(:board1) { create(:board, team: team) }
  let(:board2) { create(:board, team: team) }
  let(:lane1_board1) { create(:lane, board: board1) }
  let(:lane2_board1) { create(:lane, board: board1) }
  let(:lane3_board1) { create(:lane, board: board1) }
  let(:lane1_board2) { create(:lane, board: board2) }
  let(:lane2_board2) { create(:lane, board: board2) }
  
  let!(:cards_lane1_board1) { create_list(:card, 10, lane: lane1_board1, employee: employee1) }
  let!(:cards_lane2_board1) { create_list(:card, 10, lane: lane2_board1, employee: employee1) }
  let!(:cards_lane3_board1) { create_list(:card, 10, lane: lane3_board1, employee: employee1) }
  let!(:cards_lane1_board2) { create_list(:card, 10, lane: lane1_board2, employee: employee1) }
  let!(:cards_lane2_board2) { create_list(:card, 10, lane: lane2_board2, employee: employee1) }

  let(:first_card) { cards_lane1_board1.first }
  let(:card_id) { first_card.id }
  let(:to_lane_id) { first_card.lane.board.lanes.last.id }
  
  # Test suite for GET /cards
  describe 'GET /cards' do
    # make HTTP get request before each example
    before { get '/cards' }

    it 'returns cards' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /cards/:id
  describe 'GET /cards/:id' do
    before { get "/cards/#{card_id}" }

    context 'when the record exists' do
      it 'returns the card' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(card_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:card_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Card/)
      end
    end
  end

  # Test suite for POST /cards/:id/move
  describe 'POST /cards/:id/move' do
    # valid payload
    let(:valid_attributes) { { to: "#{to_lane_id}" } }

    context 'when the request is valid' do
      before { post "/cards/#{card_id}/move", params: valid_attributes }

      it 'moves a card to the specified lane' do
        puts json
        expect(json['lane_id']).to eq("#{to_lane_id}".to_i)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_lane_id) { 9999 }
      
      before { post "/cards/#{card_id}/move", params: { to: invalid_lane_id } }

      context 'when the card with specified id does not exist' do
        let(:card_id) { 99999 }

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Card/)
        end
      end

      context 'when the lane with specified id in the to: param does not exist' do

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Lane/)
        end
      end

      context 'when the lane with specified id in the to: param does not belong to the board of the card' do
        let(:invalid_lane_id) { lane1_board2.id }
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns a validation failure message' do
          expect(response.body)
              .to match(/Validation failed: Lane id in the to param is not valid/)
        end
      end
    end
  end

end
