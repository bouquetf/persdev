class DeadlinesController < ApplicationController
  before_action :check_connected
  before_action :set_domain
  before_action :set_deadline, only: [:edit, :update, :destroy]

  def index
    @deadlines = @domain.deadlines.all
  end

  def new
    @deadline = @domain.deadlines.new
  end

  def edit
  end

  def create
    @deadline = @domain.deadlines.new(deadline_params)
    @deadline.month_action = MonthAction.new(
        :month => @deadline.deadline,
        :target => @deadline.target,
        :result => @deadline.result,
        :user_id => @current_user.id
    )

    if @deadline.save

      redirect_to domain_deadlines_path(@domain), notice: 'Échéance ajoutée.'
    else
      render :new
    end
  end

  def update
    if @deadline.update(deadline_params)
      if @deadline.month_action.update(
          :month => deadline_params[:deadline],
          :target => deadline_params[:target],
          :result => deadline_params[:result]
      )
        redirect_to domain_deadlines_path(@domain), notice: 'Échéance mise à jour.'
      else
        redirect_to domain_deadlines_path(@domain), notice: 'Échéance mise à jour mais pas l\'action correspondante.'
      end
    else
      render :edit
    end
  end

  def destroy
    if @deadline.month_action
      @deadline.month_action.destroy
    end
    @deadline.destroy
    redirect_to domain_deadlines_url(@domain), notice: 'Échéance supprimée.'
  end


  private
  def set_domain
    @domain = Domain.find(params[:domain_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_deadline
    @deadline = Deadline.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def deadline_params
    params.fetch(:deadline, {}).permit(:deadline, :target, :result)
  end
end
