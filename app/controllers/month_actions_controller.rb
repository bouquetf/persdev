class MonthActionsController < ApplicationController
  before_action :set_month_action, only: [:edit, :update, :destroy]

  def index
    @month_actions = @current_user.month_actions.order(month: :asc)
  end

  # GET /month_actions/new
  def new
    @month_action = @current_user.month_actions.new
    @domains = @current_user.domains.order(note: :asc)
  end

  # GET /month_actions/1/edit
  def edit
    @domains = Domain.order(note: :asc)
  end

  # POST /month_actions
  # POST /month_actions.json
  def create
    @month_action = @current_user.month_actions.new(month_action_params)
    logger.info @month_action.target
    unless params[:Domaines] == ""
      deadline = Domain.find(params[:Domaines]).deadlines.new(
          deadline: @month_action.month,
          target: @month_action.target,
          result: @month_action.result
      )
      @month_action.deadline = deadline
    end

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
      if @month_action.deadline
        @month_action.deadline.update(
            deadline: @month_action.month,
            result: @month_action.result,
            target: @month_action.target
        )
      end
      redirect_to month_actions_path, notice: 'Action modifiée.'
    else
      render :edit
    end
  end

  # DELETE /month_actions/1
  # DELETE /month_actions/1.json
  def destroy
    if @month_action.deadline
      @month_action.deadline.destroy
    end
    @month_action.destroy
    redirect_to month_actions_url, notice: 'Action supprimée.'
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
