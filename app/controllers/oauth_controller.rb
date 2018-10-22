class OauthController < ApplicationController
  before_action :set_shop
  before_action :set_payload

  def authorize
    response = HTTParty.post("https://#{@shop}/admin/oauth/access_token", body: @payload)

    if response.code/100 == 2
      install = Install.create!({
        access_token: response['access_token'],
        myshopify_url: @shop
      })

      redirect_to "#{ENV['APP_URL']}"
    end
  end

  private

  def set_shop
    @shop = params[:shop]
  end

  def set_payload
    @payload = {
      code: params[:code],
      client_id: ENV['API_KEY'],
      client_secret: ENV['API_SECRET']
    }
  end
end
