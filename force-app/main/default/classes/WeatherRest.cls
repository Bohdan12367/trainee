public with sharing class WeatherRest {

    @AuraEnabled(Cacheable = false)
    public static Weather__c weatherReturn(String city) {
        String temperature, name, pressure, humidity, speed;
        String endPoint = 'https://api.openweathermap.org/data/2.5/weather?appid=' + Constants.APIKey + '&q=' + city;
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        Http http = new Http();
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        response = http.send(request);
        Weather__c existingWeather = [SELECT Temperature__c, Pressure__c, Humidity__c, Wind__c, City__c, Date__c, Image__c FROM Weather__c WHERE City__c = :city LIMIT 1];
        if (response.getStatusCode() == 200) {
            Map<String,Object> allData = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            Map<String,Object> result = (Map<String,Object>)(allData.get('main'));
            Map<String,Object> wind = (Map<String,Object>)(allData.get('wind'));
            temperature = String.valueOf(result.get('temp'));
            existingWeather.Temperature__c = Double.valueOf(temperature) - 273.15;
            existingWeather.Pressure__c = String.valueOf(result.get('pressure'));
            existingWeather.Humidity__c = String.valueOf(result.get('humidity'));
            existingWeather.Wind__c = String.valueOf(wind.get('speed'));
            if(existingWeather != null) {
                update existingWeather;
            } else {
                existingWeather.City__c = String.valueOf(allData.get('name'));
                insert existingWeather;
            }
        }
        return existingWeather;
    }
}