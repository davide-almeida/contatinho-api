# frozen_string_literal: true

class ViaCepClient
  def initialize(cep: nil, state: nil, city: nil, street: nil)
    @cep = cep
    @state = state
    @city = city
    @street = street
  end

  # Método para buscar endereços por CEP
  def get_address_by_cep
    response = connection.get("/ws/#{@cep}/json/")
    address = JSON.parse(response.body)

    if address['erro']
      return { error: "CEP not found: #{@cep}" }
    end

    address
  end

  # Método para buscar endereços por estado, cidade e rua
  def get_addresses
    # Valida os parâmetros necessários
    validation_result = validate_address_params
    return validation_result if validation_result[:error]

    # Monta a URL com base no estado, cidade e rua fornecidos
    path = "/ws/#{@state}/#{@city}/#{@street}/json/"
    response = connection.get(path)

    begin
      addresses = JSON.parse(response.body)
    rescue JSON::ParserError
      return { error: "Invalid response from ViaCep" }
    end

    # Verifica se o retorno é um array e se possui elementos
    if addresses.is_a?(Array) && addresses.any?
      addresses
    else
      []
    end
  end

  private

  def connection
    Faraday.new(url: 'https://viacep.com.br')
  end

  # Método para validar os parâmetros de estado, cidade e rua
  def validate_address_params
    missing_params = []
    missing_params << 'state' unless @state.to_s.strip.present?
    missing_params << 'city' unless @city.to_s.strip.present?
    missing_params << 'street' unless @street.to_s.strip.present?

    # Retorna um hash com a mensagem de erro caso algum parâmetro esteja faltando
    if missing_params.any?
      { error: "Missing parameters: #{missing_params.join(', ')}" }
    else
      {}
    end
  end
end
