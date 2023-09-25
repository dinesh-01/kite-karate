@kite
Feature: Place Order

  Background:
    * url KITE_URL
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization:  #(kite_token), X-Kite-Version: 3}
    * def order_details = read('classpath:kite/order.json')



 
Scenario Outline:  Place AMO order for Symbol <cSymbol>


    Given path '/orders/amo'
    When form field tradingsymbol = cSymbol
    When form field exchange = "NSE"
    When form field transaction_type = stock_signal
    When form field order_type = order_type
    When form field price = qbuy
    When form field quantity = qvolume
    When form field product = 'MIS'
    When form field validity = 'DAY'
    When method post
   
  
    Examples:
      | order_details |


















