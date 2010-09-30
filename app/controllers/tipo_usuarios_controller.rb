class TipoUsuariosController < ApplicationController
  # GET /tipo_usuarios
  # GET /tipo_usuarios.xml
  def index
    @tipo_usuarios = TipoUsuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_usuarios }
    end
  end

  # GET /tipo_usuarios/1
  # GET /tipo_usuarios/1.xml
  def show
    @tipo_usuario = TipoUsuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_usuario }
    end
  end

  # GET /tipo_usuarios/new
  # GET /tipo_usuarios/new.xml
  def new
    @tipo_usuario = TipoUsuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_usuario }
    end
  end

  # GET /tipo_usuarios/1/edit
  def edit
    @tipo_usuario = TipoUsuario.find(params[:id])
  end

  # POST /tipo_usuarios
  # POST /tipo_usuarios.xml
  def create
    @tipo_usuario = TipoUsuario.new(params[:tipo_usuario])

    respond_to do |format|
      if @tipo_usuario.save
        format.html { redirect_to(@tipo_usuario, :notice => 'Tipo usuario was successfully created.') }
        format.xml  { render :xml => @tipo_usuario, :status => :created, :location => @tipo_usuario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_usuarios/1
  # PUT /tipo_usuarios/1.xml
  def update
    @tipo_usuario = TipoUsuario.find(params[:id])

    respond_to do |format|
      if @tipo_usuario.update_attributes(params[:tipo_usuario])
        format.html { redirect_to(@tipo_usuario, :notice => 'Tipo usuario was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_usuarios/1
  # DELETE /tipo_usuarios/1.xml
  def destroy
    @tipo_usuario = TipoUsuario.find(params[:id])
    @tipo_usuario.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_usuarios_url) }
      format.xml  { head :ok }
    end
  end
end
