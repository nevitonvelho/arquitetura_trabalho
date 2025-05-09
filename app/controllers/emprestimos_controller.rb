class EmprestimosController < ApplicationController
  before_action :set_emprestimo, only: %i[ show edit update destroy ]

  # GET /emprestimos or /emprestimos.json
  def index
    @emprestimos = Emprestimo.all
  end

  # GET /emprestimos/1 or /emprestimos/1.json
  def show
  end

  # GET /emprestimos/new
  def new
    @emprestimo = Emprestimo.new
  end

  # GET /emprestimos/1/edit
  def edit
  end

  # POST /emprestimos or /emprestimos.json
  def create
    @emprestimo = Emprestimo.new(emprestimo_params)

    respond_to do |format|
      if @emprestimo.save
        format.html { redirect_to @emprestimo, notice: "Emprestimo was successfully created." }
        format.json { render :show, status: :created, location: @emprestimo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emprestimos/1 or /emprestimos/1.json
  def update
    respond_to do |format|
      if @emprestimo.update(emprestimo_params)
        format.html { redirect_to @emprestimo, notice: "Emprestimo was successfully updated." }
        format.json { render :show, status: :ok, location: @emprestimo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emprestimos/1 or /emprestimos/1.json
  def destroy
    @emprestimo.destroy!

    respond_to do |format|
      format.html { redirect_to emprestimos_path, status: :see_other, notice: "Emprestimo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo
      @emprestimo = Emprestimo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emprestimo_params
      params.require(:emprestimo).permit(:livro_id, :usuario_id, :data_emprestimo, :data_devolucao_prevista, :data_devolucao_real)
    end
end
