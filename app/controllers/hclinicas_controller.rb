class HclinicasController < ApplicationController
  layout "standard1-layout"
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
  	@hclinicas= Hclinica.find(:all)
    @hclinica_pages, @hclinicas = paginate :hclinicas, :per_page => 100
  end

  def show
    @hclinica = Hclinica.find(params[:id])
  end

  def new
    @hclinica = Hclinica.new
	@practicas= Practica.find(:all)
  end

  def create
    @hclinica = Hclinica.new(params[:hclinica])
		@practicas= Practica.find(:all)
    if @hclinica.save
      redirect_to :controller=>'personas', :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @hclinica = Hclinica.find(params[:id])
	@practicas= Practica.find(:all)
  end

  def update
    @hclinica = Hclinica.find(params[:id])
    if @hclinica.update_attributes(params[:hclinica])
      redirect_to :action => 'show', :id => @hclinica
    else
      render :action => 'edit'
    end
  end

  def destroy
    Hclinica.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
