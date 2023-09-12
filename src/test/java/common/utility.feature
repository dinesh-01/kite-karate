Feature: Inline JS Utils
  Scenario:
    * def getDate = function(){ var SimpleDateFormat = Java.type('java.text.SimpleDateFormat'); var sdf = new SimpleDateFormat('yyyyMMddHHmmss'); var date = new java.util.Date(); return sdf.format(date);}
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    
    #previous_hours : Current UTC Time - 1 hour
    #current_hour : Current UTC Time"
    #last_6_hours : Current UTC Time - 6 hours
    #last_24_hours : Current UTC Time - 24 hours
    #last_7_days : Current UTC Time - 7 days
    #last_30_days : Current UTC Time - 30 days
    * def getTimeRange = function(interval){ var Date = Java.type('java.util.Date'); var TimeZone = Java.type('java.util.SimpleTimeZone'); var SimpleDateFormat = Java.type('java.text.SimpleDateFormat'); var sdf = new SimpleDateFormat('yyyy-MM-dd+HH:mm'); var now = new Date; sdf.setTimeZone(new TimeZone(TimeZone.UTC_TIME, "UTC")); var MILLIS = 0; var time_stamp = now.getTime(); switch(interval) { case "previous_hour": MILLIS = 1000*60*60*1; time_stamp = time_stamp-MILLIS; break; case "current_hour": time_stamp = time_stamp+0; break; case "last_six_hour": MILLIS = 1000*60*60*6; time_stamp = time_stamp-MILLIS; break; case "last_24_hour": MILLIS = 1000*60*60*24; time_stamp = time_stamp-MILLIS; break; case "last_7_days": MILLIS = 1000*60*60*24*7; time_stamp = time_stamp-MILLIS; break; case "last_30_days": MILLIS = 1000*60*60*24*31; time_stamp = time_stamp-MILLIS; break; } return sdf.format(time_stamp);}
    * def getCombinedInitUrl = function(url){ url.replace("www.",""); return url; }
    * def getURL = function(url){if (url.contains("staging")){url = url.replace("staging-", "");return url;} else if (url.contains("freshpori")){url = url.replace("freshpori", "preprodfreshbots");return url;} else if (url.contains("freshpo")){url = url.replace("freshpo", "preprodfreshbots");return url;}else {return url;} }
