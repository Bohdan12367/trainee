public with sharing class WeatherRest {

//    @AuraEnabled(Cacheable=true)
//    public static Weather__c getWeather(String city){
//        return [SELECT Temperature__c,Pressure__c,Humidity__c,Wind__c,City__c,Date__c,Image__c FROM Weather__c WHERE City__c = :city LIMIT 1];
//    }

    @AuraEnabled(Cacheable=false)
    public static Weather__c weatherReturn(String city) {
        String APIKey = 'c840127ab41a64ffc77361a9d11b3ab3';
        String temperature,name,pressure,humidity,speed;
        String endPoint = 'https://api.openweathermap.org/data/2.5/weather?appid='+ APIKey + '&q=' + city;
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        Http http = new Http();
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        response = http.send(request);
        if (response.getStatusCode() == 200) {
            //String jsonResponse = response.getBody();
            //System.debug(jsonResponse);
            Map<String,Object> allData = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            System.debug(allData);
            Map<String,Object> result = (Map<String,Object>)(allData.get('main'));
            Map<String,Object> wind = (Map<String,Object>)(allData.get('wind'));
            temperature = String.valueOf(result.get('temp'));
            name = String.valueOf(allData.get('name'));
            pressure = String.valueOf(result.get('pressure'));
            humidity = String.valueOf(result.get('humidity'));
            speed = String.valueOf(wind.get('speed'));
            Double temperatureInt = Double.valueOf(temperature);
            Weather__c weather = new Weather__c();

            List<Weather__c> existingWeather = [SELECT Temperature__c,Pressure__c,Humidity__c,Wind__c FROM Weather__c WHERE City__c = :city LIMIT 1];
            System.debug(existingWeather);
            if(!existingWeather.isEmpty()) {
                Weather__c w = existingWeather[0];
                w.Temperature__c = temperatureInt - 273.15;
                w.Pressure__c = pressure;
                w.Humidity__c = humidity;
                w.Wind__c = speed;
                update w;
            } else {
                weather.Temperature__c = temperatureInt - 273.15;
                weather.City__c = name;
                weather.Pressure__c = pressure;
                weather.Humidity__c = humidity;
                weather.Wind__c = speed;
                insert weather;
            }
        }
        return [SELECT Temperature__c,Pressure__c,Humidity__c,Wind__c,City__c,Date__c,Image__c FROM Weather__c WHERE City__c = :city LIMIT 1];
    }
}