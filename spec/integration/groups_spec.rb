require 'swagger_helper'

describe 'messages API' do

  path '/groups' do

    post 'Creates a group' do
      tags 'Groups'
      consumes 'application/json', 'application/xml'
      parameter name: :group, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          genre: { type: :string }
        },
        required: [ 'name', 'genre' ]
      }

      response '201', 'group created' do
        let(:group) { { name: 'Dodo', genre: 'horror' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:group) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/groups/{id}' do

    get 'Retrieves a group' do
      tags 'Groups'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            genre: { type: :string }
          },
          required: [ 'id', 'name', 'genre' ]

        let(:id) { Group.create(name: 'foo', genre: 'horror').id }
        run_test!
      end

      response '404', 'group not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
