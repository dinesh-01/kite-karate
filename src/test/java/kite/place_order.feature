@kite
@parallel=false 
Feature: Place Order

  Background:
    * url KITE_URL
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization:  #(kite_token), X-Kite-Version: 3}
    * def order_details = read('classpath:kite/order.json')
    * def fullList = callonce read('classpath:kite/fetch_order.feature')
    * def JavaDemo = Java.type('JavaUtility.jsonhandler')
    * def list = fullList.result
    * print list
 


Scenario Outline:  Place Exit order for Symbol <tradingsymbol>

  * def company = function(arg) { return karate.jsonPath(arg, "$[*].tradingsymbol") }
  * def res = call company list


  * def fullist = function(x){ return  x == tradingsymbol}
  * def result = karate.filter(res, fullist)
  * def  stockcount =  result.length

  * if ("<status>" == "COMPLETE" && stockcount == 1) karate.call('place_order_exit.feature', { tradingsymbol: "<tradingsymbol>", transaction_type: "<transaction_type>", average_price: "<average_price>", filled_quantity: "<filled_quantity>" })

  Examples:
  | list |

   

















