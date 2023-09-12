@kite
@parallel=false 
Feature: Place Order

  Background:
    * url KITE_URL
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization:  #(kite_token), X-Kite-Version: 3}
    * def order_details = read('classpath:kite/order.json')
    * def fullList = callonce read('classpath:kite/fetch_order.feature')
    * def list = fullList.result


 

Scenario Outline:  Place Stop loss order for Symbol <tradingsymbol>
  * def execute_price = ""
  * if ("<tradingsymbol>" == "") karate.call('place_order_exit_stoploss.feature', { tradingsymbol: "<tradingsymbol>", transaction_type: "<transaction_type>", trigger_price: "<execute_price>", filled_quantity: "<filled_quantity>" })
  Examples:
  | list |

   

















