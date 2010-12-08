class CarroSomsController < ApplicationController
  # GET /carro_soms
  # GET /carro_soms.xml
  def index
    @carro_soms = CarroSom.all
    @carro_soms = CarroSom.search(params[:search])
    @carro_soms = @carro_soms.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @carro_soms }
    end
  end

  # GET /carro_soms/1
  # GET /carro_soms/1.xml
  def show
    @carro_som = CarroSom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @carro_som }
    end
  end

  # GET /carro_soms/new
  # GET /carro_soms/new.xml
  def new
    @carro_som = CarroSom.new
    @pessoa = Pessoa.new

    @pessoas = Pessoa.find(:all).map { |u| [u.nome + ' - ' + u.cpf + ';'] }.uniq
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @carro_som }
    end
  end

  # GET /carro_soms/1/edit
  def edit
    @carro_som = CarroSom.find(params[:id])
    @pessoas = Pessoa.find(:all).map { |u| [u.nome + ' - ' + u.cpf + ';'] }.uniq
  end

  # POST /carro_soms
  # POST /carro_soms.xml
  def create
    @carro_som = CarroSom.new(params[:carro_som])    
#    unless CarroSom.find(params[:pessoa.nome])
    @carro_som.pessoa = Pessoa.new(params[:pessoa])
 #   end

    respond_to do |format|
      if @carro_som.save
        format.html { redirect_to(@carro_som, :notice => ' - Carro de som cadastrado com sucesso.') }
        format.xml  { render :xml => @carro_som, :status => :created, :location => @carro_som }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @carro_som.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /carro_soms/1
  # PUT /carro_soms/1.xml
  def update
    @carro_som = CarroSom.find(params[:id])
    @carro_som.pessoa.update_attributes(params[:pessoa])  

    respond_to do |format|
      if @carro_som.update_attributes(params[:carro_som])
        format.html { redirect_to(@carro_som, :notice => ' - Dados atualizados com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @carro_som.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /carro_soms/1
  # DELETE /carro_soms/1.xml
  def destroy
    @carro_som = CarroSom.find(params[:id])
    @carro_som.destroy

    respond_to do |format|
      format.html { redirect_to(carro_soms_url) }
      format.xml  { head :ok }
    end
  end
end
