class PlansController < ApplicationController
  before_action :set_domain, only: [:show, :edit, :update, :destroy]

  def show
    @plan = @domain.plan
    if @plan == nil
      logger.fatal "No plan for domain #{@domain.id}"
      @domain.plan = Plan.create(
          vision: "",
          target: "",
          role: "",
          axis: "",
          resources: ""
      )
      @plan = @domain.plan
    end
  end

  def edit
  end

  def update
    if @domain.plan.update(plan_params)
      redirect_to domain_plan_path(@domain)
    else
      format.html { render :edit }
    end
  end

  def destroy
    @plan = @domain.plan
    plan.vision = ""
    plan.target = ""
    plan.role = ""
    plan.axis = ""
    plan.resources = ""
    plan.save!
    redirect_to [@domain, @plan]
  end

  private
  def set_domain
    @domain = Domain.find(params[:domain_id])
  end

  def plan_params
    params.fetch(:plan, {}).permit(:vision, :target, :role, :axis, :resources, :domain)
  end
end
