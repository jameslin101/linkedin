class LinkedinProfilesController < ApplicationController
  # GET /linkedin_profiles
  # GET /linkedin_profiles.json
  def index
    @linkedin_profiles = LinkedinProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @linkedin_profiles }
    end
  end

  # GET /linkedin_profiles/1
  # GET /linkedin_profiles/1.json
  def show
    @linkedin_profile = LinkedinProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @linkedin_profile }
    end
  end

  # GET /linkedin_profiles/new
  # GET /linkedin_profiles/new.json
  def new
    @linkedin_profile = LinkedinProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @linkedin_profile }
    end
  end

  # GET /linkedin_profiles/1/edit
  def edit
    @linkedin_profile = LinkedinProfile.find(params[:id])
  end

  # POST /linkedin_profiles
  # POST /linkedin_profiles.json
  def create
    @linkedin_profile = LinkedinProfile.new(params[:linkedin_profile])

    respond_to do |format|
      if @linkedin_profile.save
        format.html { redirect_to @linkedin_profile, notice: 'Linkedin profile was successfully created.' }
        format.json { render json: @linkedin_profile, status: :created, location: @linkedin_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @linkedin_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /linkedin_profiles/1
  # PUT /linkedin_profiles/1.json
  def update
    @linkedin_profile = LinkedinProfile.find(params[:id])

    respond_to do |format|
      if @linkedin_profile.update_attributes(params[:linkedin_profile])
        format.html { redirect_to @linkedin_profile, notice: 'Linkedin profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @linkedin_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linkedin_profiles/1
  # DELETE /linkedin_profiles/1.json
  def destroy
    @linkedin_profile = LinkedinProfile.find(params[:id])
    @linkedin_profile.destroy

    respond_to do |format|
      format.html { redirect_to linkedin_profiles_url }
      format.json { head :no_content }
    end
  end
end
