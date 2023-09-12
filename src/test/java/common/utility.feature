Feature: Inline JS Utils
  Scenario:
    * def getDate = function(){ var SimpleDateFormat = Java.type('java.text.SimpleDateFormat'); var sdf = new SimpleDateFormat('yyyyMMddHHmmss'); var date = new java.util.Date(); return sdf.format(date);}
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    