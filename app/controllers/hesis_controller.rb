class HesisController < ApplicationController
  before_action :set_hesi, only: %i[ show edit update destroy ]
  before_action :set_students, only: %i[ create show edit update destroy]
# GET /hesis or /hesis.json
  def index
    @hesis = Hesi.all
  end

  # GET /hesis/1 or /hesis/1.json
  def show
  end

  # GET /hesis/new
  def new
    @hesi = Hesi.new

    @hesi.students.build
  end

  # GET /hesis/1/edit
  def edit
  end

  # POST /hesis or /hesis.json
  def create
    @hesi = Hesi.new(hesi_params)

    respond_to do |format|
      if @hesi.save
        format.html { redirect_to hesi_url(@hesi), notice: "Hesi was successfully created." }
        format.json { render :show, status: :created, location: @hesi }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hesi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hesis/1 or /hesis/1.json
  def update
    respond_to do |format|
      if @hesi.update(hesi_params)
        format.html { redirect_to hesi_url(@hesi), notice: "Hesi was successfully updated." }
        format.json { render :show, status: :ok, location: @hesi }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hesi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hesis/1 or /hesis/1.json
  def destroy
    @hesi.destroy

    respond_to do |format|
      format.html { redirect_to hesis_url, notice: "Hesi was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hesi
      @hesi = Hesi.find(:id)
    end

    # Only allow a list of trusted parameters through.
    def hesi_params
      params.require(:hesi).permit(:date, :time)
    end

    def set_students
      @students = Student.where(hesi_date: self.date, hesi_time: self.time )
    end 
end
