@isTest
global class WeatherRestMock implements HttpCalloutMock{
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"coord":{"lon":24.0232,"lat":49.8383},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}],"base":"stations","main":{"temp":284.15,"feels_like":283.26,"temp_min":284.15,"temp_max":284.15,"pressure":1019,"humidity":75,"sea_level":1019,"grnd_level":984},"visibility":10000,"wind":{"speed":3.7,"deg":195,"gust":7.58},"clouds":{"all":13},"dt":1667807697,"sys":{"country":"UA","sunrise":1667798559,"sunset":1667832751},"timezone":7200,"id":702550,"name":"Lviv","cod":200}');
        response.setStatusCode(200);
        return response;
    }
}