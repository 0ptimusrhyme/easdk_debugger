class HomeController < ApplicationController
  before_action :set_shop

  def index
    check_if_installed
  end

  private

  def check_if_installed
    @install = Install.find_by(myshopify_url: @shop)

    unless @install
      redirect_to  <<~OAUTH_URI
                      https://#{@shop}/admin/oauth/authorize?
                      client_id=#{ENV['API_KEY']}&
                      scope=write_orders,write_products&
                      redirect_uri=#{ENV['APP_URL']}/authorize
                    OAUTH_URI
    end
  end

  def set_shop
    @shop = params[:shop]
  end
end
