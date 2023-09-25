@kite
Feature: Token

  Background:
    * url "https://kite.zerodha.com"
    * configure followRedirects = false

Scenario:  Fetech all Executed Orders
    Given path '/connect/login'
    * param v = 3
    * param api_key = "asx9hj1ykmv09kgc"
    When method get
    