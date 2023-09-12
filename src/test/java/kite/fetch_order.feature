@kite
Feature: Fetch Order

  Background:
    * url KITE_URL
    * configure headers = { Content-Type: 'application/x-www-form-urlencoded', Authorization:  #(kite_token), X-Kite-Version: 3}

Scenario:  Fetech all Executed Orders
    Given path '/orders'
    When method get
    * def result = response.data
    

   
   


















