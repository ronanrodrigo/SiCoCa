class PlacaCasasController < ApplicationController
  # GET /placa_casas
  # GET /placa_casas.xml
  def index
    @placa_casas = PlacaCasa.all
    @placa_casas = PlacaCasa.search(params[:search])
    @placa_casas = @placa_casas.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @placa_casas }
    end
  end

  # GET /placa_casas/1
  # GET /placa_casas/1.xml
  def show
    @placa_casa = PlacaCasa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @placa_casa }
    end
  end

  # GET /placa_casas/new
  # GET /placa_casas/new.xml
  def new
    @placa_casa = PlacaCasa.new
 #   @placa      = Placa.new
 #  @pessoa     = Pessoa.new
    
    @pessoas = Pessoa.find(:all).map { |u| [u.nome + ' - ' + u.cpf + ';'] }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @placa_casa }
    end
  end

  # GET /placa_casas/1/edit
  def edit
    @placa_casa = PlacaCasa.find(params[:id])
  end

  # POST /placa_casas
  # POST /placa_casas.xml
  def create
    @placa_casa = PlacaCasa.new(params[:placa_casa])
    @placa_casa.pessoa = Pessoa.new(params[:pessoa])    
    @placa_casa.placa = Placa.new(params[:placa])    
    
    respond_to do |format|
      if @placa_casa.save
        format.html { redirect_to(@placa_casa, :notice => ' - Placa cadastrada com sucesso.') }
        format.xml  { render :xml => @placa_casa, :status => :created, :location => @placa_casa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @placa_casa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /placa_casas/1
  # PUT /placa_casas/1.xml
  def update
    @placa_casa = PlacaCasa.find(params[:id])
    @placa_casa.pessoa.update_attributes(params[:pessoa])  
    @placa_casa.placa.update_attributes(params[:placa])
    
    respond_to do |format|
      if @placa_casa.update_attributes(params[:placa_casa])
        format.html { redirect_to(@placa_casa, :notice => ' - Dados atualizados com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @placa_casa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /placa_casas/1
  # DELETE /placa_casas/1.xml
  def destroy
    @placa_casa = PlacaCasa.find(params[:id])
    @placa_casa.destroy

    respond_to do |format|
      format.html { redirect_to(placa_casas_url) }
      format.xml  { head :ok }
    end
  end
  
  def filepdf
    # PDFKit.new takes the HTML and any options for wkhtmltopdf
    # run `wkhtmltopdf --extended-help` for a full list of options
    kit = PDFKit.new(html, :page_size => 'Letter')
    kit.stylesheets << '/path/to/css/file'

    # Git an inline PDF
    pdf = kit.to_pdf

    # Save the PDF to a file
    file = kit.to_file('/path/to/save/pdf')
  end
end
