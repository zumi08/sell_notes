class LectureInformationsController < ApplicationController
  before_action :set_lecture_information, only: [:show, :edit, :update, :destroy]
  layout 'af_log'
  # GET /lecture_informations
  # GET /lecture_informations.json
  def index
    @lecture_informations = LectureInformation.all
  end

  # GET /lecture_informations/1
  # GET /lecture_informations/1.json
  def show
  end

  # GET /lecture_informations/new
  def new
    @lecture_information = LectureInformation.new
  end

  # GET /lecture_informations/1/edit
  def edit
  end

  # POST /lecture_informations
  # POST /lecture_informations.json
  def create
    binding.pry
    @lecture_information = LectureInformation.new(lecture_information_params)

    respond_to do |format|
      if @lecture_information.save
        format.html { redirect_to @lecture_information, notice: 'Lecture information was successfully created.' }
        format.json { render :show, status: :created, location: @lecture_information }
      else
        format.html { render :new }
        format.json { render json: @lecture_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecture_informations/1
  # PATCH/PUT /lecture_informations/1.json
  def update
    respond_to do |format|
      if @lecture_information.update(lecture_information_params)
        format.html { redirect_to @lecture_information, notice: 'Lecture information was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture_information }
      else
        format.html { render :edit }
        format.json { render json: @lecture_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecture_informations/1
  # DELETE /lecture_informations/1.json
  def destroy
    @lecture_information.destroy
    respond_to do |format|
      format.html { redirect_to lecture_informations_url, notice: 'Lecture information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_information
      @lecture_information = LectureInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_information_params
      params.fetch(:lecture_information, {})
    end
end
