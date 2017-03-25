require 'httparty'
require 'json'
class Kele
    include HTTParty
    include JSON

   def initialize(email, password)
      @user = {'email': email, 'password': password}
      response = self.class.post(base_api('sessions'), body: @user)
      raise "An error has occured" if response == 401
      @auth_token = response['auth_token']
   end
   
   def get_me
      headers = {
         :content_type => 'application/json',
         :authorization => @auth_token
      }
      response = self.class.get base_api("users/me"), headers
      @user_email = JSON.parse(response.body)
      puts @user_email
      puts JSON.parse(response.body)
   end
   
end

private

def base_api(target)
   "https://www.bloc.io/api/v1/#{target}" 
end