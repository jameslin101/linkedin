LINKEDIN_CONFIGURATION = { :site => 'https://api.linkedin.com',
                          :authorize_path => '/uas/oauth/authenticate',
                          :request_token_path =>'/uas/oauth/requestToken?scope=r_fullprofile+r_emailaddress+r_network+r_contactinfo',
                          :access_token_path => '/uas/oauth/accessToken' }

client.request_token.authorize_url

pin = "85531"

atoken, asecret = client.authorize_from_request(client.request_token.token, client.request_token.secret, pin)

                          
PROFILE_FIELDS = {:fields => ["id",                
                              "first-name",        
                              "last-name",         
                              "headline",          
                              "location",          
                              "industry",          
                              "summary",           
                              "specialties",       
                              "email-address",
                              "educations",
                              "positions"                             
                             ]}
                             
client.profile(PROFILE_FIELDS)
 