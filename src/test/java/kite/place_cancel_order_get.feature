@kite
Feature: Place Order

  Background:
    * url "https://api.kite.trade"
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization: #(kite_token), X-Kite-Version: 3}



 
Scenario:  Place Cancel order GET Validation complete

    Given path 'orders/'+orderid
    When method GET
    * def result = response.data

    * def conditions = function(arg) { return karate.jsonPath(arg, "[?(@.status == 'CANCELLED')]") }
    * def result = call conditions result
    * def count  =  result.length
    * print count
    * if (count == 0) karate.call('place_cancel_order_delete.feature', { orderid: orderid })



   
  


















