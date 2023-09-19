@kite
Feature: Place Order

  Background:
    * url KITE_URL
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization:  #(kite_token), X-Kite-Version: 3}
    * def JavaDemo = Java.type('JavaUtility.calculation')
   

 
Scenario: Place Stoploss order 
  
   Given path '/orders/regular'
   When form field tradingsymbol = tradingsymbol
   When form field exchange = "NSE"
   When form field transaction_type = transaction_type
   When form field order_type = "SL-M"
   When form field trigger_price = trigger_price
   When form field quantity = filled_quantity
   When form field product = 'MIS'
   When form field validity = 'DAY'
  # When method post
  

  
  


   

















