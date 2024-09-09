# frozen_string_literal: true

require 'cpf_validator'

RSpec.describe CpfValidator do
  describe '.valid?' do
    context 'when CPF is valid' do
      it 'returns true for a valid CPF' do
        valid_cpf = '123.456.789-09' # Exemplo fictício de CPF válido
        expect(CpfValidator.valid?(valid_cpf)).to be true
      end

      it 'returns true for a valid CPF without formatting' do
        valid_cpf = '12345678909' # Mesmo CPF sem máscara
        expect(CpfValidator.valid?(valid_cpf)).to be true
      end
    end

    context 'when CPF is invalid' do
      it 'returns false for an invalid CPF' do
        invalid_cpf = '123.456.789-00'
        expect(CpfValidator.valid?(invalid_cpf)).to be false
      end

      it 'returns false for a CPF with all identical digits' do
        invalid_cpf = '111.111.111-11'
        expect(CpfValidator.valid?(invalid_cpf)).to be false
      end

      it 'returns false for a CPF with less than 11 digits' do
        invalid_cpf = '123.456.789'
        expect(CpfValidator.valid?(invalid_cpf)).to be false
      end

      it 'returns false for a CPF with more than 11 digits' do
        invalid_cpf = '123.456.789.123'
        expect(CpfValidator.valid?(invalid_cpf)).to be false
      end
    end
  end
end
