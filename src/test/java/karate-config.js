function fn() {

    var config = { // base config JSON
        KITE_URL: "https://api.kite.trade",
        kite_token: "<token>",
        util: karate.callSingle('classpath:common/utility.feature')
    };

    karate.configure('ssl', true);
    return config;
}