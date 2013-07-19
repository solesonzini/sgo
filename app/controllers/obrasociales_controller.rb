class ObrasocialesController < ApplicationController
    layout "standard1-layout"
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @obrasociale_pages, @obrasociales = paginate :obrasociales, :per_page => 9
  end

  def show
    @obrasociale = Obrasociale.find(params[:id])
  end

  def new
    @obrasociale = Obrasociale.new
  end

  def create
    @obrasociale = Obrasociale.new(params[:obrasociale])
    if @obrasociale.save
      flash[:notice] = 'Obrasociale was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @obrasociale = Obrasociale.find(params[:id])
  end

  def update
    @obrasociale = Obrasociale.find(params[:id])
    if @obrasociale.update_attributes(params[:obrasociale])
      flash[:notice] = 'Obrasociale was successfully updated.'
      redirect_to :action => 'show', :id => @obrasociale
    else
      render :action => 'edit'
    end
  end

  def destroy
    Obrasociale.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
