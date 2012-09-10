class AuthController < ApplicationController

  LINKEDIN_CONFIGURATION = { :site => 'https://api.linkedin.com',
                            :authorize_path => '/uas/oauth/authenticate',
                            :request_token_path =>'/uas/oauth/requestToken?scope=r_fullprofile+r_emailaddress+r_network+r_contactinfo',
                            :access_token_path => '/uas/oauth/accessToken' }

  PROFILE_FIELDS = {:fields => ["id",                
                                "first-name",        
                                "last-name",         
                                "headline",          
                                "location",          
                                "industry",          
                                "summary",           
                                "specialties",       
                                "picture-url",       
                                "public-profile-url", 
                                "email-address",
                                "educations",
                                "positions"                             
                               ]}

  def index
    # get your api keys at https://www.linkedin.com/secure/developer
    
    client = LinkedIn::Client.new(LINKEDIN_API_KEY, LINKEDIN_SECRET_KEY, LINKEDIN_CONFIGURATION )
    request_token = client.request_token(:oauth_callback => 
                                      "http://#{request.host_with_port}/auth/callback")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect_to client.request_token.authorize_url

  end

  def callback
    
    client = LinkedIn::Client.new(LINKEDIN_API_KEY, LINKEDIN_SECRET_KEY, LINKEDIN_CONFIGURATION)
    #if session[:atoken].nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      session[:atoken] = atoken
      session[:asecret] = asecret
    #else
    #  client.authorize_from_access(session[:atoken], session[:asecret])
    #end
    profile = client.profile(PROFILE_FIELDS)
    @profile = Profile.find_or_create_by(linkedinid: profile.id)
    @profile.first_name         = profile.first_name
    @profile.last_name          = profile.last_name              
    @profile.headline,          = profile.headline            
    @profile.location,          = profile.location.name         
    @profile.industry,          = profile.industry               
    @profile.summary,           = profile.summary                
    @profile.specialties,       = profile.specialties            
    @profile.picture_url,       = profile.picture_url            
    @profile.public_profile_url = profile.public_profile_url 
    @profile.email_address      = profile.email_address
    
    profile.educations.all.each do |education|
      ed = @profile.educations.find_or_create_by(linkedinid: education.id)
      ed.field_of_study = education.field_of_study
      ed.degree         = education.degree
      ed.school_name    = education.school_names
      ed.start_date = Date.new(education.start_date.year, education.start_date.month) if education.start_date
      ed.end_date = Date.new(education.end_date.year, education.start_date.month) if education.end_date
    end
    
    profile.positions.all.each do |position|
      pos = @profile.positions.find_or_create_by(linkedinid: position.id)
      company         = position.company 
      comp            = Company.find_or_create_by(linkedinid: company.id)
      comp.industry   = company.industry
      comp.name       = company.name
      comp.size       = company.size
      comp.type       = company.type
      pos.company     = comp
      pos.is_current  = position.is_current
      pos.summary     = position.summary
      pos.title       = position.title
      pos.start_date = Date.new(position.start_date.year, position.start_date.month) if position.start_date
      pos.end_date = Date.new(position.end_date.year, position.start_date.month) if position.end_date
    end   
    
    @profile.save
  end
end