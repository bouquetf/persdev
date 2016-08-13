class DayActionsController < ApplicationController
  include DayActionsHelper
  before_action :set_day_action, only: [:edit, :update, :destroy]

  # GET /day_actions
  # GET /day_actions.json
  def index
    @day_actions = current_user.day_actions.order(day: :asc)
  end

  # GET /day_actions/new
  def new
    @day_action = current_user.day_actions.new
  end

  # GET /day_actions/1/edit
  def edit
    @day_action = DayAction.find(params[:id])
    @day_action.hours = @day_action[:duration].to_i / 60
    @day_action.minutes = @day_action[:duration].to_i % 60
  end

  # POST /day_actions
  # POST /day_actions.json
  def create
    @day_action = current_user.day_actions.new(day_action_params)
    @day_action.duration =
        day_action_params[:hours].to_i * 60 + day_action_params[:minutes].to_i

      if @day_action.save
        redirect_to day_actions_path, notice: 'Action ajoutée'
      else
        render :new
      end
  end

  def update
    @day_action.duration = day_action_params[:hours].to_i * 60 + day_action_params[:minutes].to_i

    if @day_action.update(day_action_params)
        redirect_to day_actions_path, notice: 'Action mise à jour'
      else
        render :edit
      end
  end

  # DELETE /day_actions/1
  # DELETE /day_actions/1.json
  def destroy
    @day_action.destroy
    redirect_to day_actions_url, notice: 'Action supprimée.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_action
      @day_action = DayAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_action_params
      params.require(:day_action).permit(:day,
                                         :importance,
                                         :duration,
                                         :action,
                                         :target,
                                         :user_id,
                                         :hours,
                                         :minutes,
                                         :result)
    end
end
