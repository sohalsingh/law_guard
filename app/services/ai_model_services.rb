class AiModelService
  include HTTParty
  base_uri 'http://localhost:3000'  # Adjust the URL to your FastAPI server's address

  def self.analyze(file_path)
    file = File.open(Rails.root.join('public', file_path), 'rb')
    response = post('/analyze', body: { file: file }, headers: { 'Content-Type' => 'multipart/form-data' })
    file.close
    JSON.parse(response.body, symbolize_names: true)
  end
end
