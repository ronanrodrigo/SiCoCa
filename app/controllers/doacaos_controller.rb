class DoacaosController < ApplicationController
  # GET /doacaos
  # GET /doacaos.xml
  def index
    @doacaos = Doacao.all
    
    @doacaos = @doacaos.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doacaos }
    end
  end

  # GET /doacaos/1
  # GET /doacaos/1.xml
  def show
    @doacao = Doacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doacao }
    end
  end

  # GET /doacaos/new
  # GET /doacaos/new.xml
  def new
    @doacao = Doacao.new
    @pessoa = Pessoa.new
    @pessoas = Pessoa.find(:all).map { |u| [u.nome + ' - ' + u.cpf + ';'] }
    #@pessoas = Pessoa.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doacao }
    end
  end

  # GET /doacaos/1/edit
  def edit
    @doacao = Doacao.find(params[:id])
  end

  # POST /doacaos
  # POST /doacaos.xml
  def create
    @doacao = Doacao.new(params[:doacao])
    @doacao.pessoa = Pessoa.new(params[:pessoa])    
    
    respond_to do |format|
      if @doacao.save
        format.html { redirect_to(@doacao, :notice => ' - Doação cadastrada com sucesso.') }
        format.xml  { render :xml => @doacao, :status => :created, :location => @doacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doacaos/1
  # PUT /doacaos/1.xml
  def update
    @doacao = Doacao.find(params[:id])
    @doacao.pessoa.update_attributes(params[:pessoa])  
    
    respond_to do |format|
      if @doacao.update_attributes(params[:doacao])
        format.html { redirect_to(@doacao, :notice => ' - Dados atualizados com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doacaos/1
  # DELETE /doacaos/1.xml
  def destroy
    @doacao = Doacao.find(params[:id])
    @doacao.destroy
    
    respond_to do |format|
      format.html { redirect_to(doacaos_url) }
      format.xml  { head :ok }
    end
  end
end
