# vgs-sinatra

Welcome to A Very Secure Sinatra App

To run this app:
1. Clone the repo
2. From the app directory, use the command `ruby app.rb` to start the server
3. Navigate to `http://localhost:4567/` to see the payment form

Starting Ngrok and setting up with VGS:
1. Download ngrok and follow the instructions at https://ngrok.com/ to start your ngrok server
2. From the terminal or web app, copy the ngrok forwarding address.
3. Navigate to your VGS account and go to the routes view
4. Click on "manage" for your inbound route. 
5. In the "Upstream Host" field, add your ngrok forwarding address.
6. Click on "Manage" for your outbound route, and add this same address to the "Upstream Host" field.

Adding fields to your VGS inbound filter:
1. With the "Manage" view open in your inbound route, add the following 3 fields under the JSON tab:
$.cc_number
$.cc_exp
$.cvv

2. Navidate to "Manage" for your outbound route. Add the same 3 fields as above.

Sending Data:
Add information to the fields in the form on http://localhost:4567/ and press submit. 
The page will redirect to the `payment` view. 
In your VGS account under `logs`, you should be able to see a 201 success log and success.
Click into the link for the log and you should see that the 3 fields were successfully redacted.

Retrieving Data:
Navigate to http://localhost:4567/secure
The data for these accounts will be automatically retrieved from the echo server, and will be visible in the network call log. 
