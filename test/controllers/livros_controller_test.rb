require "test_helper"

class LivrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @livro = livros(:one)
  end

  test "should get index" do
    get livros_url
    assert_response :success
  end

  test "should get new" do
    get new_livro_url
    assert_response :success
  end

  test "should create livro" do
    assert_difference("Livro.count") do
      post livros_url, params: { livro: { ano_publicacao: @livro.ano_publicacao, autor: @livro.autor, categoria_id: @livro.categoria_id, editora: @livro.editora, isbn: @livro.isbn, titulo: @livro.titulo } }
    end

    assert_redirected_to livro_url(Livro.last)
  end

  test "should show livro" do
    get livro_url(@livro)
    assert_response :success
  end

  test "should get edit" do
    get edit_livro_url(@livro)
    assert_response :success
  end

  test "should update livro" do
    patch livro_url(@livro), params: { livro: { ano_publicacao: @livro.ano_publicacao, autor: @livro.autor, categoria_id: @livro.categoria_id, editora: @livro.editora, isbn: @livro.isbn, titulo: @livro.titulo } }
    assert_redirected_to livro_url(@livro)
  end

  test "should destroy livro" do
    assert_difference("Livro.count", -1) do
      delete livro_url(@livro)
    end

    assert_redirected_to livros_url
  end
end
