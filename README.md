# Kite Karate
Documnetation
https://github.com/karatelabs/karate



Place AMO Market Order =>
mvn clean test  -Dkarate.options="classpath:kite/place_order_amo.feature"


Place Trigger Order =>
mvn clean test  -Dkarate.options="classpath:kite/place_order.feature"


StopLoss => mvn clean test  -Dkarate.options="classpath:kite/place_order_stoploss.feature"

Note : Ensure to mention the symbol

