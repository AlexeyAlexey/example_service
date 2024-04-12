module API
  module V1
    class HelloWorld < Grape::API

      resource :hello_world do

        desc 'Returns Hello World'
        get '/' do
          # present {}, with: API::Entities::HelloWorld

          { message: 'Hello World' }
        end
      end
    end
  end
end
