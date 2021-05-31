require 'swagger_helper'

describe 'Session API' do
  before do
    @user = User.create(email: 'test@example.com', password: 'password', role: 'customer')
  end

  path '/api/auth/sign_in' do

    post 'Create a session' do
      tags 'Session'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '200', 'Login Success' do
        let(:user) { { email: @user.email, password: 'password' } }
        run_test!
      end

      response '401', 'Error: Unauthorized' do
        let(:user) { { email: @user.email, password: 'wrongpassword' } }
        run_test!
      end
    end
  end
end
