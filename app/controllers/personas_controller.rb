class PersonasController < ApplicationController
  layout "standard1-layout"
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
  @personas = Persona.find(:all)
  @persona_pages, @personas = paginate :personas, :per_page => 10
  end

  def show
    @persona = Persona.find(params[:id])
  end

  def new
    @persona = Persona.new
	@obrasociales= Obrasociale.find(:all)
  end

  def create
    @persona = Persona.new(params[:persona])
	@obrasociales= Obrasociale.find(:all)
    if @persona.save
      flash[:notice] = 'Persona was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @persona = Persona.find(params[:id])
	@obrasociales= Obrasociale.find(:all)
  end

  def update
    @persona = Persona.find(params[:id])
    if @persona.update_attributes(params[:persona])
      flash[:notice] = 'Persona was successfully updated.'
      redirect_to :action => 'show', :id => @persona
    else
      render :action => 'edit'
    end
  end

  def destroy
    Persona.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
