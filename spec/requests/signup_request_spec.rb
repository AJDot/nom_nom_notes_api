# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Signups', type: :request do
  describe '#create' do
    before do
      Features::Service.new.enable(:signup)
    end

    let(:signup_params) do
      {
        email: 'philip.fry@planet-express.com',
        password: 'ah123456',
        password_confirmation: 'ah123456',
        username: 'orangejoe',
      }
    end

    context 'with valid params' do
      it 'creates a user' do
        expect do
          post '/auth/create-account', as: :json, params: signup_params
        end.to(change(User, :count).by(1))
      end

      describe 'response' do
        before do
          post '/auth/create-account', as: :json, params: signup_params
        end

        include_examples 'content type', :json
        include_examples 'http status', :ok
      end
    end

    context 'without valid username' do
      before do
        signup_params[:username] = nil
      end

      describe 'response' do
        before do
          post '/auth/create-account', as: :json, params: signup_params
        end

        include_examples 'content type', :json
        include_examples 'http status', :unprocessable_entity
      end

      it 'does not create a user' do
        expect { post '/auth/create-account', as: :json, params: signup_params }.not_to(change(User, :count))
      end
    end

    context 'when feature is disabled' do
      before { Features::Service.new[:signup].disable }

      describe 'response' do
        before do
          post '/auth/create-account', as: :json, params: signup_params
        end

        include_examples 'content type', :json
        include_examples 'http status', :forbidden
      end

      it 'does not create a user' do
        expect { post '/auth/create-account', as: :json, params: signup_params }.not_to(change(User, :count))
      end
    end
  end
end
