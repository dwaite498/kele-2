require 'httparty'
require 'json'
require_relative 'roadmap'

class Kele
    include HTTParty
    include Roadmap

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
   
end

private

def base_api(target)
   "https://www.bloc.io/api/v1/#{target}" 
end