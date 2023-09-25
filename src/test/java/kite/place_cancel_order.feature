@kite
@parallel=false 
Feature: Exit Order check

  Background:
    * url KITE_URL
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization:  #(kite_token), X-Kite-Version: 3}
    * def order_details = read('classpath:kite/order.json')
    * def list =  read('classpath:kite/sample.json')
  


Scenario Outline:  Place Cancel order for Symbol <tradingsymbol>

  
    * def conditions1 = function(arg) { return karate.jsonPath(arg, "[?(@.tradingsymbol == '<tradingsymbol>' && @.status == 'COMPLETE')]") }
    * def result1 = call conditions1 list
    * def count1  =  result1.length

    * def conditions2 = function(arg) { return karate.jsonPath(arg, "[?(@.tradingsymbol == '<tradingsymbol>' && @.status == 'OPEN')]") }
    * def result2 = call conditions2 list
    * def orderid = result2[0]['order_id']
    * def count2  =  result2.length

    * if (count1 == 2 && count2 == 1) karate.call('place_cancel_order_get.feature', { tradingsymbol: "<tradingsymbol>", orderid: orderid })


  
  Examples:
  | list |

   

















