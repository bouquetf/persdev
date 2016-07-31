class MonthActionsController < ApplicationController
  before_action :set_month_action, only: [:show, :edit, :update, :destroy]

  def index
    @month_actions = @current_user.month_actions.all
  end

  # GET /month_actions/new
  def new
    @month_action = @current_user.month_actions.new
  end

  # GET /month_actions/1/edit
  def edit
  end

  # POST /month_actions
  # POST /month_actions.json
  def create
    @month_action = @current_user.month_actions.new(month_action_params)

    if @month_action.save
      redirect_to month_actions_path, notice: 'Action ajoutée.'
    else
      render :new
    end
  end

  # PATCH/PUT /month_actions/1
  # PATCH/PUT /month_actions/1.json
  def update
    if @month_action.update(month_action_params)
      redirect_to month_actions_path, notice: 'Action modifiée.'
    else
      render :edit
    end
  end

  # DELETE /month_actions/1
  # DELETE /month_actions/1.json
  def destroy
    @month_action.destroy
    redirect_to month_actions_url, notice: 'Month action was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_month_action
    @month_action = @current_user.month_actions.find(params[:id])
  end

  def month_action_params
    params.require(:month_action).permit(:month, :result, :target, :user_id)
  end
end
