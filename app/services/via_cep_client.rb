# frozen_string_literal: true

class ViaCepClient
  def initialize(cep)
    @cep = cep
  end

  def get_address
    response = connection.get("/ws/#{@cep}/json/")
    address = JSON.parse(response.body)

    if address['erro']
      raise InvalidCepError, "CEP not found: #{@cep}"
    end

    address
  end

  private

  def connection
    Faraday.new(url: 'https://viacep.com.br')
  end

  class InvalidCepError < StandardError; end
end
