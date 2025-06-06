class LivrosController < ApplicationController
  before_action :set_livro, only: %i[ show edit update destroy ]

  # GET /livros or /livros.json
  def index
    @livros = Livro.all
  end

  # GET /livros/1 or /livros/1.json
  def show
  end

  # GET /livros/new
  def new
    @livro = Livro.new
  end

  # GET /livros/1/edit
  def edit
  end

  # POST /livros or /livros.json
  def create
    @livro = Livro.new(livro_params)

    respond_to do |format|
      if @livro.save
        format.html { redirect_to @livro, notice: "Livro was successfully created." }
        format.json { render :show, status: :created, location: @livro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @livro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /livros/1 or /livros/1.json
  def update
    respond_to do |format|
      if @livro.update(livro_params)
        format.html { redirect_to @livro, notice: "Livro was successfully updated." }
        format.json { render :show, status: :ok, location: @livro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @livro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /livros/1 or /livros/1.json
  def destroy
    @livro.destroy!

    respond_to do |format|
      format.html { redirect_to livros_path, status: :see_other, notice: "Livro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livro
      @livro = Livro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def livro_params
      params.require(:livro).permit(:titulo, :autor, :editora, :ano_publicacao, :isbn, :categoria_id)
    end
end
