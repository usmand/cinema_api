require 'swagger_helper'

describe 'Blogs API' do
  before do
    @user = User.create(email: 'customer1234@example.com', password: 'password', role: 'customer')
    @auth_params = @user.create_new_auth_token
    @movie = Movie.create(title: 'foo', imdb_id: rand(16**9).to_s(16))
  end

  path '/api/movies' do

    get 'Retrieves movies' do
      tags 'Movies'
      consumes 'application/json'
      parameter name: 'access-token', in: :header, type: :string, required: true
      parameter name: 'client', in: :header, type: :string, required: true
      parameter name: 'uid', in: :header, type: :string, required: true

      let('access-token') { @auth_params['access-token'] }
      let('client') { @auth_params['client'] }
      let('uid') { @auth_params['uid'] }

      response '200', 'Movies' do
        let('access-token') { @auth_params['access-token'] }
        let('client') { @auth_params['client'] }
        let('uid') { @auth_params['uid'] }

        run_test!
      end
    end
  end

  path '/api/movies/{id}' do

    get 'Retrieves a movie' do
      tags 'Movies'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      parameter name: 'access-token', in: :header, type: :string, required: true
      parameter name: 'client', in: :header, type: :string, required: true
      parameter name: 'uid', in: :header, type: :string, required: true

      let('access-token') { @auth_params['access-token'] }
      let('client') { @auth_params['client'] }
      let('uid') { @auth_params['uid'] }
      let(:id) { @movie.imdb_id }

      response '200', 'Movie found' do
        run_test!
      end
    end
  end

  path '/api/movies/{id}' do

    put 'Update a movie' do
      tags 'Movies'
      produces 'application/json', 'application/xml'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :movie, in: :body, schema: {
        type: :object,
        properties: {
          showtimes: { type: :string },
          price: { type: :number }
        },
        required: [ 'showtimes', 'price' ]
      }
      parameter name: 'access-token', in: :header, type: :string, required: true
      parameter name: 'client', in: :header, type: :string, required: true
      parameter name: 'uid', in: :header, type: :string, required: true

      let('access-token') { @auth_params['access-token'] }
      let('client') { @auth_params['client'] }
      let('uid') { @auth_params['uid'] }
      let(:id) { @movie.imdb_id }

      response '200', 'Movie updated' do
        run_test!
      end
    end
  end

  path '/api/movies/{id}/review' do

    post 'Review a movie' do
      tags 'Movies'
      produces 'application/json', 'application/xml'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :review, in: :body, schema: {
        type: :object,
        properties: {
          feedback: { type: :string },
          score: { type: :number }
        },
        required: [ 'score' ]
      }
      parameter name: 'access-token', in: :header, type: :string, required: true
      parameter name: 'client', in: :header, type: :string, required: true
      parameter name: 'uid', in: :header, type: :string, required: true

      let('access-token') { @auth_params['access-token'] }
      let('client') { @auth_params['client'] }
      let('uid') { @auth_params['uid'] }
      let(:id) { @movie.imdb_id }

      response '200', 'New Review' do
        run_test!
      end
    end
  end
end
