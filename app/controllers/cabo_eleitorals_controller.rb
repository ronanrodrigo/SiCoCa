class CaboEleitoralsController < ApplicationController
  # GET /cabo_eleitorals
  # GET /cabo_eleitorals.xml
  def index
    @cabo_eleitorals = CaboEleitoral.all
    @cabo_eleitorals = @cabo_eleitorals.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cabo_eleitorals }
    end
  end

  # GET /cabo_eleitorals/1
  # GET /cabo_eleitorals/1.xml
  def show
    @cabo_eleitoral = CaboEleitoral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cabo_eleitoral }
    end
  end

  # GET /cabo_eleitorals/new
  # GET /cabo_eleitorals/new.xml
  def new
    @cabo_eleitoral = CaboEleitoral.new
    @pessoa = Pessoa.new
    @pessoas = Pessoa.find(:all).map { |u| [u.nome + ' - ' + u.cpf + ';'] }
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cabo_eleitoral }
    end
  end

  # GET /cabo_eleitorals/1/edit
  def edit
    @cabo_eleitoral = CaboEleitoral.find(params[:id])
  end

  # POST /cabo_eleitorals
  # POST /cabo_eleitorals.xml
  def create
    @cabo_eleitoral = CaboEleitoral.new(params[:cabo_eleitoral])
    @cabo_eleitoral.pessoa = Pessoa.new(params[:pessoa])    
    
    respond_to do |format|
      if @cabo_eleitoral.save
        format.html { redirect_to(@cabo_eleitoral, :notice => ' - Cabo eleitoral cadastrado com sucesso.') }
        format.xml  { render :xml => @cabo_eleitoral, :status => :created, :location => @cabo_eleitoral }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cabo_eleitoral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cabo_eleitorals/1
  # PUT /cabo_eleitorals/1.xml
  def update
    @cabo_eleitoral = CaboEleitoral.find(params[:id])
    @cabo_eleitoral.pessoa.update_attributes(params[:pessoa])  

    respond_to do |format|
      if @cabo_eleitoral.update_attributes(params[:cabo_eleitoral])
        format.html { redirect_to(@cabo_eleitoral, :notice => ' - Dados atualizados com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cabo_eleitoral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cabo_eleitorals/1
  # DELETE /cabo_eleitorals/1.xml
  def destroy
    @cabo_eleitoral = CaboEleitoral.find(params[:id])
    @cabo_eleitoral.destroy

    respond_to do |format|
      format.html { redirect_to(cabo_eleitorals_url) }
      format.xml  { head :ok }
    end
  end
end
