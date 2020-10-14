class ProponentesController < ApplicationController
  before_action :set_proponente, only: [:show, :edit, :update, :destroy]

  # GET /proponentes
  # GET /proponentes.json
  def index
    @proponentes = Proponente.all
  end

  # GET /proponentes/1
  # GET /proponentes/1.json
  def show
  end

  # GET /proponentes/new
  def new
    @proponente = Proponente.new
  end

  # GET /proponentes/1/edit
  def edit
  end

  # POST /proponentes
  # POST /proponentes.json
  def create
    @proponente = Proponente.new(proponente_params)

    respond_to do |format|
      if @proponente.save
        format.html { redirect_to @proponente, notice: 'Proponente adicionado.' }
        format.json { render :show, status: :created, location: @proponente }
      else
        format.html { render :new }
        format.json { render json: @proponente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proponentes/1
  # PATCH/PUT /proponentes/1.json
  def update
    respond_to do |format|
      if @proponente.update(proponente_params)
        format.html { redirect_to @proponente, notice: 'Proponente atualizado.' }
        format.json { render :show, status: :ok, location: @proponente }
      else
        format.html { render :edit }
        format.json { render json: @proponente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proponentes/1
  # DELETE /proponentes/1.json
  def destroy
    @proponente.destroy
    respond_to do |format|
      format.html { redirect_to proponentes_url, notice: 'Proponente deletado.' }
      format.json { head :no_content }
    end
  end

  def get_desconto
    n = params[:salario].to_f
    caps = Array[1045.00, 2089.60, 3134.40, 6101.06]
    quotes = Array[78.37, 94.01, 125.38, 415.33]
    tax = Array[0.075, 0.09, 0.12, 0.14]
    i = 0
    if n > caps.last
      puts n
      @desconto = quotes.sum.round(2)
      return @desconto
    else
      caps.each do |cap|
        if cap > n 
          puts cap
          @desconto = (quotes.take(i).sum + (n-caps[i-1])*tax[i]).round(2)
          return @desconto
        end
        i += 1
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proponente
      @proponente = Proponente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proponente_params
      params.require(:proponente).permit(:nome, :cpf, :data_nasc, :logradouro, :numero, :bairro, :cidade, :estado, :cep, :telefone_pessoal, :telefone_referencia, :salario)
    end
end
