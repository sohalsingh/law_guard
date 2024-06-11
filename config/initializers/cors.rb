Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'localhost:4000'  # Replace this with your frontend URL
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end
  end
  