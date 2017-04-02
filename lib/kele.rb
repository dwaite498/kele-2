require 'httparty'
require 'json'
require_relative 'roadmap'
require_relative 'message'

class Kele
    include HTTParty
    include Roadmap
    include Message
   #  debug_output $stdout
    
    attr_reader :auth_token

   def initialize(email, password)
      @user = {'email': email, 'password': password}
      response = self.class.post base_api('sessions'), body: @user
      raise "An error has occured" unless response.code.between?(200, 299)
      @auth_token = response['auth_token']
   end
   
   def get_me
      response = self.class.get base_api("users/me"), headers: { :authorization => @auth_token }
      print response.body
      @user_data = JSON.parse(response.body)
   end
   
   # mentor_id = 592292
   
   def get_mentor_availability(mentor_id)
      response = self.class.get base_api("mentors/#{mentor_id}/student_availability"), headers: { :authorization => @auth_token }
      @mentor_availability = JSON.parse(response.body)
      puts response
   end
   
   def submit_checkpoint # https://github.com/jnunemaker/httparty/tree/master/examples [examples of different httparty uses]
   options = {
      body: {
         "assignment_branch": "assignment-22-iterative-search",
         "assignment_commit_link": "https:/github.com/me/repo/commit/5",
         "checkpoint_id": 2162,
         "comment": "test checkpoint submission",
         "enrollment_id": 20332
      },
      headers: {
         :authorization => @auth_token
      }
   }
      response = self.class.post base_api("checkpoint_submissions"), options
      puts response
   end
end

private

def base_api(target)
   "https://www.bloc.io/api/v1/#{target}" 
end