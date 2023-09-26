@kite
@parallel=false 
Feature: Exit Order check

  Background:
    * url KITE_URL
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization:  #(kite_token), X-Kite-Version: 3}
    * def order_details = read('classpath:kite/order.json')
    * def fullList =  callonce read('classpath:kite/fetch_order.feature')
    * def list = fullList.result 
    * def orderid1 = ""
    * def orderid2 = ""
    * def sleep = function(pause){ java.lang.Thread.sleep(pause*1000) }
  


Scenario Outline:  Place Cancel order for Symbol <tradingsymbol>

    * def conditions1 = function(arg) { return karate.jsonPath(arg, "[?(@.tradingsymbol == '<tradingsymbol>' && @.status == 'COMPLETE')]") }
    * def result1 = call conditions1 list
    * def count1  =  result1.length
    * print count1

    * def conditions2 = function(arg) { return karate.jsonPath(arg, "[?(@.tradingsymbol == '<tradingsymbol>' && @.status == 'OPEN')]") }
    * def result2 = call conditions2 list
    * print result2
    * def count2  =  result2.length

     * if (count2 != 0) orderid1 = result2[0]['order_id']

    * def conditions3 = function(arg) { return karate.jsonPath(arg, "[?(@.tradingsymbol == '<tradingsymbol>' && @.status == 'TRIGGER PENDING')]") }
    * def result3 = call conditions3 list
    * print result3
    * def count3  =  result3.length

    * if (count3 != 0) orderid2 = result3[0]['order_id']


    * if (count1 == 2 && count2 == 1) karate.call('place_cancel_order_get.feature', { tradingsymbol: "<tradingsymbol>", orderid: orderid1 })
    * if (count1 == 2 && count3 == 1) karate.call('place_cancel_order_get.feature', { tradingsymbol: "<tradingsymbol>", orderid: orderid2 })


    * sleep(1)

  Examples:
  | list |

   

















