class TwesController < ApplicationController
  before_action :require_login, except: [:index]
  before_action :set_twe, only: [:show, :edit, :update, :destroy]

  # GET /twes
  # GET /twes.json
  def index
    @twes = Twe.all
    @twe  = Twe.new
  end

  # GET /twes/1
  # GET /twes/1.json
  def show
  end

  # GET /twes/new
  def new
    @twe = Twe.new
  end

  # GET /twes/1/edit
  def edit
  end

  # POST /twes
  # POST /twes.json
  def create
    @twe = Twe.new(twe_params)
    @twe.user = current_user

    respond_to do |format|
      if @twe.save
        format.html { redirect_to twes_url, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @twe }
      else
        format.html { render :new }
        format.json { render json: @twe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twes/1
  # PATCH/PUT /twes/1.json
  def update
    respond_to do |format|
      if @twe.update(twe_params)
        format.html { redirect_to @twe, notice: 'Twe was successfully updated.' }
        format.json { render :show, status: :ok, location: @twe }
      else
        format.html { render :edit }
        format.json { render json: @twe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twes/1
  # DELETE /twes/1.json
  def destroy
    @twe.destroy
    respond_to do |format|
      format.html { redirect_to twes_url, notice: 'Twe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twe
      @twe = Twe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twe_params
      params.require(:twe).permit(:content)
    end
end
