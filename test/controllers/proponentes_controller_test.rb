require 'test_helper'

class ProponentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proponente = proponentes(:one)
  end

  test "should get index" do
    get proponentes_url
    assert_response :success
  end

  test "should get new" do
    get new_proponente_url
    assert_response :success
  end

  test "should create proponente" do
    assert_difference('Proponente.count') do
      post proponentes_url, params: { proponente: { bairro: @proponente.bairro, cep: @proponente.cep, cidade: @proponente.cidade, cpf: @proponente.cpf, data_nasc: @proponente.data_nasc, estado: @proponente.estado, logradouro: @proponente.logradouro, nome: @proponente.nome, numero: @proponente.numero, salario: @proponente.salario, telefone_pessoal: @proponente.telefone_pessoal, telefone_referencia: @proponente.telefone_referencia } }
    end

    assert_redirected_to proponente_url(Proponente.last)
  end

  test "should show proponente" do
    get proponente_url(@proponente)
    assert_response :success
  end

  test "should get edit" do
    get edit_proponente_url(@proponente)
    assert_response :success
  end

  test "should update proponente" do
    patch proponente_url(@proponente), params: { proponente: { bairro: @proponente.bairro, cep: @proponente.cep, cidade: @proponente.cidade, cpf: @proponente.cpf, data_nasc: @proponente.data_nasc, estado: @proponente.estado, logradouro: @proponente.logradouro, nome: @proponente.nome, numero: @proponente.numero, salario: @proponente.salario, telefone_pessoal: @proponente.telefone_pessoal, telefone_referencia: @proponente.telefone_referencia } }
    assert_redirected_to proponente_url(@proponente)
  end

  test "should destroy proponente" do
    assert_difference('Proponente.count', -1) do
      delete proponente_url(@proponente)
    end

    assert_redirected_to proponentes_url
  end
end
