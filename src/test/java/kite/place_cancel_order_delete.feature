@kite
Feature: Place Order

  Background:
    * url "https://api.kite.trade"
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization: #(kite_token), X-Kite-Version: 3}



 
Scenario:  Place Cancel order DELETE complete

    Given path 'orders/regular/'+orderid
    When method DELETE
    
   
  


















