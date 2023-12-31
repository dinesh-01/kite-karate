@kite
Feature: Place Order

  Background:
    * url KITE_URL
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization:  #(kite_token), X-Kite-Version: 3}
    * def JavaDemo = Java.type('JavaUtility.calculation')
   

 
Scenario: Place Exit and Stoploss order for Symbol 
  
   * def reverse_signal = "SELL"
   * if (transaction_type == "SELL") reverse_signal = "BUY"

   * print tradingsymbol

   * def target    = JavaDemo.calculate_target(transaction_type,average_price,'target')
   * print target
   * print reverse_signal

   Given path '/orders/regular'
   When form field tradingsymbol = tradingsymbol
   When form field exchange = "NSE"
   When form field transaction_type = reverse_signal
   When form field order_type = "LIMIT"
   When form field price = target
   When form field quantity = filled_quantity
   When form field product = 'MIS'
   When form field validity = 'DAY'
   When method post


   * def stoploss    = JavaDemo.calculate_target(reverse_signal,average_price,'stoploss')
   * print stoploss
   * print reverse_signal

   Given path '/orders/regular'
   When form field tradingsymbol = tradingsymbol
   When form field exchange = "NSE"
   When form field transaction_type = reverse_signal
   When form field order_type = "SL-M"
   When form field trigger_price = stoploss
   When form field quantity = filled_quantity
   When form field product = 'MIS'
   When form field validity = 'DAY'
   When method post


  

  
  


   

















