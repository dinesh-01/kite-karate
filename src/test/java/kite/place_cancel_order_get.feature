@kite
Feature: Place Order

  Background:
    * url "https://api.kite.trade"
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization: KITE_TOKEN, X-Kite-Version: 3}



 
@amo
Scenario:  Place Cancel order complete

    * print tradingsymbol
    * print orderid
   

   # Given path '/orders/regular'
   # When form field tradingsymbol = cSymbol
   # When form field exchange = "NSE"
   # When form field transaction_type = stock_signal
   # When form field order_type = order_type
   # When form field quantity = qvolume
   # When form field product = 'MIS'
   # When form field validity = 'DAY'
   # When method post
   
  


















