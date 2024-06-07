# app/services/ai_model_service.rb
class AiModelService
    include HTTParty
    base_uri 'http://localhost:3000'
  
    def self.analyze(file_content)
      response = post('/analyze', body: { file: file_content }, headers: { 'Content-Type' => 'multipart/form-data' })
      JSON.parse(response.body, symbolize_names: true)
    end
  end
  