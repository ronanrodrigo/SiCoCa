class CavaletesController < ApplicationController
  # GET /cavaletes
  # GET /cavaletes.xml
  def index
    @cavaletes = Cavalete.all
    @cavaletes = Cavalete.search(params[:search])
    @cavaletes = @cavaletes.paginate :page => params[:page], :order => 'placas.cep DESC', :per_page => 10
    
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.set_map_type_init(GMapType::G_NORMAL_MAP)
    @map.center_zoom_init(@cavaletes.first.placa.fetch_coordinates,11)

    @cavaletes.each do |cavalete|
      @map.overlay_init(GMarker.new([cavalete.placa.latitude,cavalete.placa.longitude], :title => "Placa residencial", :info_window => "<b>Placa residencial</b><BR>" + cavalete.placa.endereco))
      @marker = GMarker.new(cavalete.placa.fetch_coordinates,:title => "Update", :info_window => "I have been placed through RJS")
    end
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cavaletes }
    end
  end

  # GET /cavaletes/1
  # GET /cavaletes/1.xml
  def show
    @cavalete = Cavalete.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cavalete }
    end
  end

  # GET /cavaletes/new
  # GET /cavaletes/new.xml
  def new
    @cavalete = Cavalete.new
    @placa = Placa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cavalete }
    end
  end

  # GET /cavaletes/1/edit
  def edit
    @cavalete = Cavalete.find(params[:id])
  end

  # POST /cavaletes
  # POST /cavaletes.xml
  def create
    @cavalete = Cavalete.new(params[:cavalete])
    @cavalete.placa = Placa.new(params[:placa])
    
    respond_to do |format|
      if @cavalete.save
        format.html { redirect_to(@cavalete, :notice => ' - Cavalete cadastrado com sucesso.') }
        format.xml  { render :xml => @cavalete, :status => :created, :location => @cavalete }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cavalete.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cavaletes/1
  # PUT /cavaletes/1.xml
  def update
    @cavalete = Cavalete.find(params[:id])
    @cavalete.placa.update_attributes(params[:placa])
    
    respond_to do |format|
      if @cavalete.update_attributes(params[:cavalete])
        format.html { redirect_to(@cavalete, :notice => ' - Dados atualizados com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cavalete.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cavaletes/1
  # DELETE /cavaletes/1.xml
  def destroy
    @cavalete = Cavalete.find(params[:id])
    @cavalete.destroy

    respond_to do |format|
      format.html { redirect_to(cavaletes_url) }
      format.xml  { head :ok }
    end
  end
end
