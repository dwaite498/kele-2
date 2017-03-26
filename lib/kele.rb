require 'httparty'
<<<<<<< HEAD
require JSON
=======
require 'json'
>>>>>>> master
class Kele
    include HTTParty
    include JSON

   def initialize(email, password)
      @user = {'email': email, 'password': password}
      response = self.class.post base_api('sessions'), body: @user
      raise "An error has occured" if response == 401
      @auth_token = response['auth_token']
   end
   
   def get_mentor_availability
      mentor_id = 592292
      response = self.class.get base_api('mentors/#{mentor_id}/student_availability'), headers: { :authorization => @auth_token }
      @mentor_availability = JSON.parse(response.body)
      puts response
   end
   
   def get_me
      response = self.class.get base_api("users/me"), headers: { :authorization => @auth_token }
      @user_data = JSON.parse(response.body)
      puts JSON.parse(response.body)
   end
   
end

private

def base_api(target)
   "https://www.bloc.io/api/v1/#{target}" 
end