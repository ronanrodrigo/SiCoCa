class PlacaCasasController < ApplicationController
  # GET /placa_casas
  # GET /placa_casas.xml
  def index
    @placa_casas = PlacaCasa.all
    @placa_casas = PlacaCasa.search(params[:search])
    @placa_casas = @placa_casas.paginate :page => params[:page], :order => 'created_at ASC', :per_page => 10

    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.set_map_type_init(GMapType::G_NORMAL_MAP)
    @map.center_zoom_init(@placa_casas.first.placa.fetch_coordinates,14)

    @placa_casas.each do |placa_casa|
      @map.overlay_init(GMarker.new([placa_casa.placa.latitude,placa_casa.placa.longitude], :title => "Placa residencial", :info_window => "<b>Placa residencial</b><BR>" + placa_casa.placa.endereco))
      @marker = GMarker.new(placa_casa.placa.fetch_coordinates,:title => "Update", :info_window => "I have been placed through RJS")
    end

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

    @pessoas = Pessoa.find(:all).map { |u| [u.nome + ' - ' + u.cpf + ';'] }.uniq

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @placa_casa }
    end
  end

  # GET /placa_casas/1/edit
  def edit
    @placa_casa = PlacaCasa.find(params[:id])
    @pessoas = Pessoa.find(:all).map { |u| [u.nome + ' - ' + u.cpf + ';'] }.uniq
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
    kit = PDFKit.new(html, :page_size => 'Letter')
    kit.stylesheets << '/path/to/css/file'
    pdf = kit.to_pdf
    file = kit.to_file('/path/to/save/pdf')
  end
end
