class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show create edit update destroy ]
  before_action :ensure_no_more_than_10_testers, only: %i[ create update]

  # GET /students or /students.json
  def index
    if params[:query].present?
      @students = Student.where("name iLIKE ?", "%#{params[:query]}%")
    else
      @students = Student.all.order(:created_at)
    end
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:phone] && params[:name] || params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :program_id, :start_date, :advisor_id, :sle, :phone, :attempt_number, :hesi_date, :hesi_time)
    end

    def set_hesi
      @hesi = Hesi.where(date: student_params[:hesi_date], time: student_params[:hesi_time]) || Hesi.new(student_params[:hesi_date], student_params[:hesi_time])
    end

    def ensure_no_more_than_10_testers
      testers = Student.where(hesi_date: student_params[:hesi_date], hesi_time: student_params[:hesi_time])
      unless testers.size < 10
        render :new, status: :unprocessable_entity, notice: "That testing time is already full"
      end
    end

end
