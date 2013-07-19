class TurnosController < ApplicationController
    layout "standard1-layout"
  def index
    list
    render :action => 'list'
  end

  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @turno_pages, @turnos = paginate :turnos, :per_page => 10, :order => 'hora asc'
      end

  def show
    @turno = Turno.find(params[:id])
	@turnos= Turno.find(:all)
  end

  def new
    @turno = Turno.new
  end

  def create
    @turno = Turno.new(params[:turno])
    if @turno.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @turno = Turno.find(params[:id])
  end

  def update
    @turno = Turno.find(params[:id])
    if @turno.update_attributes(params[:turno])
      redirect_to :action => 'show', :id => @turno
    else
      render :action => 'edit'
    end
  end

  def destroy
    Turno.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
