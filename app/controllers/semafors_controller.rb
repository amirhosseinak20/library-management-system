class SemaforsController < ApplicationController
  before_action :set_semafor, only: [:show, :edit, :update, :destroy]

  # GET /semafors
  # GET /semafors.json
  def index
    @semafors = Semafor.all
  end

  # GET /semafors/1
  # GET /semafors/1.json
  def show
  end

  # GET /semafors/new
  def new
    @semafor = Semafor.new
  end

  # GET /semafors/1/edit
  def edit
  end

  # POST /semafors
  # POST /semafors.json
  def create
    @semafor = Semafor.new(semafor_params)

    respond_to do |format|
      if @semafor.save
        format.html { redirect_to @semafor, notice: 'Semafor was successfully created.' }
        format.json { render :show, status: :created, location: @semafor }
      else
        format.html { render :new }
        format.json { render json: @semafor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semafors/1
  # PATCH/PUT /semafors/1.json
  def update
    respond_to do |format|
      if @semafor.update(semafor_params)
        format.html { redirect_to @semafor, notice: 'Semafor was successfully updated.' }
        format.json { render :show, status: :ok, location: @semafor }
      else
        format.html { render :edit }
        format.json { render json: @semafor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semafors/1
  # DELETE /semafors/1.json
  def destroy
    @semafor.destroy
    respond_to do |format|
      format.html { redirect_to semafors_url, notice: 'Semafor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semafor
      @semafor = Semafor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def semafor_params
      params.fetch(:semafor, {})
    end
end
