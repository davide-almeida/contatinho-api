# frozen_string_literal: true

class CpfValidator
  def self.valid?(cpf)
    # Remove qualquer máscara (pontos, hífens, etc.)
    cpf = cpf.gsub(/[^\d]/, '')

    # Verifica se o CPF tem 11 dígitos
    return false unless cpf.length == 11

    # Verifica se todos os dígitos são iguais (o que torna o CPF inválido)
    return false if cpf.chars.uniq.length == 1

    # Calcula o primeiro dígito verificador
    first_digit = calculate_digit(cpf[0..8])
    # Calcula o segundo dígito verificador
    second_digit = calculate_digit(cpf[0..9])

    # Verifica se os dígitos calculados são iguais aos dígitos verificadores fornecidos
    cpf[-2] == first_digit.to_s && cpf[-1] == second_digit.to_s
  end

  private

  def self.calculate_digit(digits)
    # Converte os dígitos em um array de inteiros
    numbers = digits.chars.map(&:to_i)

    # Define o peso inicial com base no número de dígitos
    weight = numbers.length + 1

    # Calcula a soma ponderada dos dígitos
    sum = numbers.each_with_index.reduce(0) do |acc, (digit, index)|
      acc + digit * (weight - index)
    end

    # Calcula o dígito verificador
    result = 11 - (sum % 11)
    result > 9 ? 0 : result
  end
end
