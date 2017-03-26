require 'httparty'
class Kele
    include HTTParty

   def initialize(email, password)
      @user = {'email': email, 'password': password}
      response = self.class.post(base_api('sessions'), body: @user)
      raise "An error has occured" if response == 401
      @auth_token = response['auth_token']
      puts @auth_token
   end
   
   def det_mentor_availability(mentor_id)
     
      response = self.class.get(@base_api('mentors/#{mentor_id}/student_availability'))
      puts response
      
      
   end
end

private

def base_api(target)
   "https://www.bloc.io/api/v1/#{target}" 
end