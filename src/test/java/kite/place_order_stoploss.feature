@kite
@parallel=false 
Feature: Place Order

  Background:
    * url KITE_URL
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization:  #(kite_token), X-Kite-Version: 3}
    * def fullList = callonce read('classpath:kite/fetch_order.feature')
    * def list = fullList.result
    * def JavaDemo = Java.type('JavaUtility.calculation')


 

Scenario Outline:  Place Stop loss order for Symbol <tradingsymbol>

   * def stoploss    = JavaDemo.calculate_target("<transaction_type>","<average_price>",'stoploss')
   * print stoploss
  

  * if ("<status>" == "OPEN") karate.call('place_order_exit_stoploss.feature', { tradingsymbol: "<tradingsymbol>", transaction_type: "<transaction_type>", trigger_price: stoploss, filled_quantity: "<quantity>" })
  Examples:
  | list |

   

















