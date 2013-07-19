class PracticasController < ApplicationController
   layout "standard1-layout"
 def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @practica_pages, @practicas = paginate :practicas, :per_page => 10
  end

  def show
    @practica = Practica.find(params[:id])
  end

  def new
    @practica = Practica.new
  end

  def create
    @practica = Practica.new(params[:practica])
    if @practica.save
      flash[:notice] = 'Practica was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @practica = Practica.find(params[:id])
  end

  def update
    @practica = Practica.find(params[:id])
    if @practica.update_attributes(params[:practica])
      flash[:notice] = 'Practica was successfully updated.'
      redirect_to :action => 'show', :id => @practica
    else
      render :action => 'edit'
    end
  end

  def destroy
    Practica.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
