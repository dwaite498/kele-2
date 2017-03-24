class Kele
    include 'httparty'

    
   def initialize(email, password)
      @user = {'email': email, 'password': password}
      response = self.class.post('https://www.bloc.io/api/v1/sessions', body: @user)
      raise "invalid email or password" if response != 200
      @auth_token = response['auth_token']
      puts @auth_token
   end
end