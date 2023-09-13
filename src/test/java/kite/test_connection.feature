@kite
@parallel=false 
Feature: Place Order

  Background:
    * url KITE_URL
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization:  #(kite_token), X-Kite-Version: 3}
    * def order_details = read('classpath:kite/order.json')
    * def fullList = callonce read('classpath:kite/fetch_order.feature')
    * def list = fullList.result


 

Scenario Outline:  Place Exit order for Symbol <tradingsymbol>

    * print tradingsymbol

  Examples:
  | list |

   

















