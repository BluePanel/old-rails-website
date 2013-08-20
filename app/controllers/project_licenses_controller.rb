class ProjectLicensesController < ApplicationController
  before_action :set_project_license, only: [:show, :edit, :update, :destroy]

  # GET /project_licenses
  # GET /project_licenses.json
  def index
    @project_licenses = ProjectLicense.all
  end

  # GET /project_licenses/1
  # GET /project_licenses/1.json
  def show
  end

  # GET /project_licenses/new
  def new
    @project_license = ProjectLicense.new
  end

  # GET /project_licenses/1/edit
  def edit
  end

  # POST /project_licenses
  # POST /project_licenses.json
  def create
    @project_license = ProjectLicense.new(project_license_params)

    respond_to do |format|
      if @project_license.save
        format.html { redirect_to @project_license, notice: 'Project license was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_license }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_licenses/1
  # PATCH/PUT /project_licenses/1.json
  def update
    respond_to do |format|
      if @project_license.update(project_license_params)
        format.html { redirect_to @project_license, notice: 'Project license was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_licenses/1
  # DELETE /project_licenses/1.json
  def destroy
    @project_license.destroy
    respond_to do |format|
      format.html { redirect_to project_licenses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_license
      @project_license = ProjectLicense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_license_params
      params.require(:project_license).permit(:name, :license_url, :license_text)
    end
end
