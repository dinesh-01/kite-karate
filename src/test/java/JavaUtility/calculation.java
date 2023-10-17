package JavaUtility;

public class calculation {

    public static double calculate_target(String order_type, String kprice, String category) {
        

       double price = Double.parseDouble(kprice); 
       double percentage_cal = 1.5;

       if(category.equals("stoploss")) {
          percentage_cal = 0.6;

       }

       if(category.equals("target")) {
           percentage_cal = 1.5;
       }


       
       double cal = 0;
       cal = percentage_cal / 100 ;
       
       double diff = price * cal ;
       double final_price = 0;


        if(order_type.equals("SELL")) {
                final_price = price - diff;
        }

        if(order_type.equals("BUY")) {
            final_price = price + diff;

        }


         final_price  = (double) (Math.round(final_price*10.0)/10.0);


        return final_price;


    }

}
