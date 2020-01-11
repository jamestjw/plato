class OrganisationsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]
  before_action :delete_organisation_users, only: [:destroy]

  # GET /organisations
  # GET /organisations.json
  def index
    @organisations = Organisation.all
  end

  # GET /organisations/1
  # GET /organisations/1.json
  def show
    @users = @organisation.users
  end

  # GET /organisations/new
  def new
    @organisation = Organisation.new
  end

  # GET /organisations/1/edit
  def edit
  end

  # POST /organisations
  # POST /organisations.json
  def create
    @organisation = Organisation.new(organisation_params)

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: 'Organisation was successfully created.' }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisations/1
  # PATCH/PUT /organisations/1.json
  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to @organisation, notice: 'Organisation was successfully updated.' }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1
  # DELETE /organisations/1.json
  def destroy
    @organisation.destroy
    respond_to do |format|
      format.html { redirect_to organisations_url, notice: 'Organisation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    organisation_type = params[:user][:organisation_type]
    begin
      User.transaction do 
        case organisation_type
        when "New Organisation"
          org_params = params.require(:user).permit(:new_organisation_name, :new_organisation_description)
          org = Organisation.new_org(org_params[:new_organisation_name], org_params[:new_organisation_description], current_user)
          current_user.organisation_owner = true
          current_user.save!
        when "Existing"
          org_params = params.require(:user).permit(:existing_organisation)
          org = Organisation.find(org_params[:existing_organisation])
          current_user.organisations << org
          current_user.save!
        when "No Organisation"
          Organisation.new_org('Individual user', 'Individual user', current_user)
          current_user.organisation_owner = true
          current_user.save!
        else
          respond_to do |format|
            format.html { redirect_to(root_url, alert: 'Choose a valid organisation plan.') and return }
            format.json { head :no_content }
          end  
        end
      end
    rescue 
      respond_to do |format|
        format.html { redirect_to(root_url, alert: 'Unsuccessful, wrong parameters were given.') and return }
        format.json { head :no_content }
      end   
    end

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Successfully joined organisation.' }
      format.json { head :no_content }
    end    
  end

  class Error < StandardError
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organisation_params
      params.require(:organisation).permit(:name, :description, :created_by)
    end

    def delete_organisation_users
      @organisation.users.each do |user|
        user.destroy
      end
    end

    def join_organisations_params  
    end
end
