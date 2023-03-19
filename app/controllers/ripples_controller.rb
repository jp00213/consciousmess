class RipplesController < ApplicationController
  before_action :set_ripple, only: %i[ show edit update destroy ]

  # GET /ripples or /ripples.json
  def index
    @ripples = Ripple.all.order('created_at DESC')
  end

  # GET /ripples/1 or /ripples/1.json
  def show
  end

  # GET /ripples/new
  def new
    @ripple = Ripple.new
  end

  # GET /ripples/1/edit
  def edit
  end

  # POST /ripples or /ripples.json
  def create
    @ripple = Ripple.new(ripple_params)

    respond_to do |format|
      if @ripple.save
        format.html { redirect_to action: "index" }
        session[:position] = 0
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ripple.errors, status: :unprocessable_entity }
      end
    end
  end

#  Preserved update and destroy methods instead of removing for future use cases
#  Ripple model has before_update and before_destroy implemented to block actions
#  
#  # PATCH/PUT /ripples/1 or /ripples/1.json
#  def update
#    respond_to do |format|
#      if @ripple.update(ripple_params)
#        format.html { redirect_to ripple_url(@ripple), notice: "Ripple was successfully updated." }
#        format.json { render :show, status: :ok, location: @ripple }
#      else
#        format.html { render :edit, status: :unprocessable_entity }
#        format.json { render json: @ripple.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#
#  # DELETE /ripples/1 or /ripples/1.json
#  def destroy
#    @ripple.destroy
#    respond_to do |format|
#      format.html { redirect_to ripples_url, notice: "Ripple was successfully destroyed." }
#      format.json { head :no_content }
#    end
#  end

  # Sets position to a submitted value
  def setPosition(value = Integer(params[:value]))
    session[:position] = value
    respond_to do |format|
      format.html { redirect_to action: "index" }
    end
  end
  
  # Increases/decreases position by submitted value, sets to 0 if not yet initiallized
  def changePosition(value = Integer(params[:value]))
    if session[:position] == nil
      session[:position] = 0
    end
    session[:position] = Integer(session[:position]) + value
    if session[:position] < 10
      session[:position] = 0
    end
    respond_to do |format|
      format.html { redirect_to action: "index" }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ripple
      @ripple = Ripple.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ripple_params
      params.require(:ripple).permit(:name, :url, :message)
    end
end
