@IsTest
public class WeatherRestTest {
    @IsTest
    static void TestUpdate() {
        Test.setMock(HttpCalloutMock.class, new WeatherRestMock());
        Weather__c weath = new Weather__c(City__c = 'Lviv', Pressure__c = '1010');
        insert weath;

        Test.startTest();
        Weather__c weather = WeatherRest.weatherReturn('Lviv');
        Test.stopTest();
        System.assertEquals('1019', weather.Pressure__c);
    }
    @IsTest
    static void TestCreate() {
        Test.setMock(HttpCalloutMock.class, new WeatherRestMock());

        Test.startTest();
        Weather__c weather = WeatherRest.weatherReturn('Lviv');
        Test.stopTest();
        System.assertEquals('1019', weather.Pressure__c);
    }
}