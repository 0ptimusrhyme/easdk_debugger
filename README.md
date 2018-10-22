# EASDK Troubleshooting App

## Running locally

1. `bundle install`.
2. Create a `.env` file. Populate it with values for API_KEY, API_SECRET, and APP_URL (`https://domain.ngrok.io`)
3. `rails db:migrate`
4. `rails server` (make sure the port lines up with your tunnel)
5. Visit the root URL with a `shop` parameter indicative of the shop you want to install the app on (`domain.myshopify.com`).
6. Once installed, you should now be embedded. Click buttons and break stuff.

### License

MIT
