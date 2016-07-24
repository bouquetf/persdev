class DomainsController < ApplicationController
  before_action :set_domain, only: [:show, :edit, :update, :destroy]
  before_action :current_user

  # GET /domains
  # GET /domains.json
  def index
    @domains = @current_user.domains.all
  end

  # GET /domains/1
  # GET /domains/1.json
  def show
    if @domain.user != @current_user
      redirect_to domains_path
    end
  end

  # GET /domains/new
  def new
    @domain = Domain.new
  end

  # GET /domains/1/edit
  def edit
    if @domain.user != @current_user
      redirect_to domains_path
    end
  end

  # POST /domains
  # POST /domains.json
  def create
    @domain = Domain.new(domain_params)
    @domain.user = @current_user

    if @domain.save
      redirect_to domains_path, notice: 'Domain was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /domains/1
  # PATCH/PUT /domains/1.json
  def update
    if @domain.user != @current_user
      redirect_to domains_path
    end

    if @domain.update(update_params)
      redirect_to @domain, notice: 'Domain was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    if @domain.user != @current_user
      redirect_to domains_path
    end

    @domain.destroy
    redirect_to domains_url, notice: 'Domain was successfully destroyed.'
  end

  private
  def set_domain
    @domain = Domain.find(params[:id])
  end

  def domain_params
    params.fetch(:domain, {}).permit(:name, :description)
  end

  def update_params
    params.fetch(:domain, {}).permit(:name, :description, :note, :explanation)
  end
end
