@IsTest
public class WeatherRestTest {
    @IsTest
    static void Test() {
        Test.setMock(HttpCalloutMock.class, new WeatherRestMock());
        //String pressure,humidity,speed;
        //String jsonResponse =
//        HttpResponse response = new HttpResponse();
//        response.setBody('{"coord":{"lon":24.0232,"lat":49.8383},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}],"base":"stations","main":{"temp":284.15,"feels_like":283.26,"temp_min":284.15,"temp_max":284.15,"pressure":1019,"humidity":75,"sea_level":1019,"grnd_level":984},"visibility":10000,"wind":{"speed":3.7,"deg":195,"gust":7.58},"clouds":{"all":13},"dt":1667807697,"sys":{"country":"UA","sunrise":1667798559,"sunset":1667832751},"timezone":7200,"id":702550,"name":"Lviv","cod":200}');

        //Weather__c result = WeatherRest.weatherReturn('Lviv');
//        response.setHeader('Content-Type', 'application/json');
//        response.setBody('{"coord":{"lon":24.0232,"lat":49.8383},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}],"base":"stations","main":{"temp":284.15,"feels_like":283.26,"temp_min":284.15,"temp_max":284.15,"pressure":1019,"humidity":75,"sea_level":1019,"grnd_level":984},"visibility":10000,"wind":{"speed":3.7,"deg":195,"gust":7.58},"clouds":{"all":13},"dt":1667807697,"sys":{"country":"UA","sunrise":1667798559,"sunset":1667832751},"timezone":7200,"id":702550,"name":"Lviv","cod":200}');
//        response.setStatusCode(200);
//        String response = ('{"coord":{"lon":24.0232,"lat":49.8383},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],"base":"stations","main":{"temp":287.42,"feels_like":286.5,"temp_min":287.42,"temp_max":287.42,"pressure":1018,"humidity":61,"sea_level":1018,"grnd_level":984},"visibility":10000,"wind":{"speed":3.85,"deg":228,"gust":8.51},"clouds":{"all":34},"dt":1667817273,"sys":{"country":"UA","sunrise":1667798559,"sunset":1667832751},"timezone":7200,"id":702550,"name":"Lviv","cod":200}');
//        Map<String,Object> allData = (Map<String,Object>)JSON.deserializeUntyped(response);
//        Map<String,Object> result = (Map<String,Object>)(allData.get('main'));
//        Map<String,Object> wind = (Map<String,Object>)(allData.get('wind'));
//        pressure = String.valueOf(result.get('pressure'));
//        humidity = String.valueOf(result.get('humidity'));
//        speed = String.valueOf(wind.get('speed'));
        //response.setStatusCode(200);
        //Weather__c w = new Weather__c(City__c = 'Lviv', Pressure__c = pressure);
//        String pressure,humidity,speed, name;
//        String response = ('{"coord":{"lon":24.0232,"lat":49.8383},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],"base":"stations","main":{"temp":287.42,"feels_like":286.5,"temp_min":287.42,"temp_max":287.42,"pressure":1018,"humidity":61,"sea_level":1018,"grnd_level":984},"visibility":10000,"wind":{"speed":3.85,"deg":228,"gust":8.51},"clouds":{"all":34},"dt":1667817273,"sys":{"country":"UA","sunrise":1667798559,"sunset":1667832751},"timezone":7200,"id":702550,"name":"Bolton","cod":200}');
//        Map<String,Object> allData = (Map<String,Object>)JSON.deserializeUntyped(response);
//        Map<String,Object> result = (Map<String,Object>)(allData.get('main'));
//        Map<String,Object> wind = (Map<String,Object>)(allData.get('wind'));
//        pressure = String.valueOf(result.get('pressure'));
//        humidity = String.valueOf(result.get('humidity'));
//        name = String.valueOf(allData.get('name'));
//        speed = String.valueOf(wind.get('speed'));
//        Weather__c w = new Weather__c(City__c = name, Pressure__c = '1010');
//        insert w;
//        List<Weather__c> existingWeather = [SELECT Temperature__c,Pressure__c,Humidity__c,Wind__c FROM Weather__c WHERE City__c = :'Lviv' LIMIT 1];
//        System.debug(existingWeather);
//        Weather__c weath = existingWeather[0];
//        weath.Pressure__c = pressure;
//        update weath;
        Test.startTest();
        //update weath;
        Weather__c weather = WeatherRest.weatherReturn('Lviv');
        //Weather__c weather1 = WeatherRest.weatherReturn('Bolton');
        //insert w;
        Test.stopTest();
        //Weather__c weather = [SELECT Pressure__c FROM Weather__c WHERE City__c = :'Lviv' LIMIT 1];
        System.assertEquals('1019', weather.Pressure__c);
    }
}