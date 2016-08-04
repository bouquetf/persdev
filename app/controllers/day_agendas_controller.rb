class DayAgendasController < ApplicationController
  before_action :set_day_agenda, only: [:show, :edit, :morning, :evening, :update, :destroy]

  # GET /day_agendas
  # GET /day_agendas.json
  def index
    @day_agendas = @current_user.day_agendas.all
  end

  def today
    today = @current_user.day_agendas.find_or_create_by(day: Date.today)

    redirect_to day_agenda_path(today)
  end

  # GET /day_agendas/1
  # GET /day_agendas/1.json
  def show
  end

  # GET /day_agendas/new
  def new
    @day_agenda = @current_user.day_agendas.new
  end

  def edit
  end

  def morning
  end

  def evening
  end

  # POST /day_agendas
  # POST /day_agendas.json
  def create
    @day_agenda = @current_user.day_agendas.new(day_agenda_params)

    respond_to do |format|
      if @day_agenda.save
        format.html { redirect_to @day_agenda, notice: 'Day agenda was successfully created.' }
        format.json { render :show, status: :created, location: @day_agenda }
      else
        format.html { render :new }
        format.json { render json: @day_agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /day_agendas/1
  # PATCH/PUT /day_agendas/1.json
  def update
    respond_to do |format|
      if @day_agenda.update(day_agenda_params)
        format.html { redirect_to @day_agenda, notice: 'Day agenda was successfully updated.' }
        format.json { render :show, status: :ok, location: @day_agenda }
      else
        format.html { render :edit }
        format.json { render json: @day_agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_agendas/1
  # DELETE /day_agendas/1.json
  def destroy
    @day_agenda.destroy
    respond_to do |format|
      format.html { redirect_to day_agendas_url, notice: 'Day agenda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_agenda
      @day_agenda = @current_user.day_agendas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_agenda_params
      params.require(:day_agenda).permit(:date, :agenda, :quote, :targets, :actions, :success)
    end
end
