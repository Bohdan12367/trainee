import {LightningElement,track,wire} from 'lwc';

import sendWeather from '@salesforce/apex/WeatherRest.weatherReturn';
//import getW from '@salesforce/apex/WeatherRest.getWeather';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class InputCity extends LightningElement {
    searchKey;
    @track weather;
    @track imageURL;

    getCity () {
         sendWeather ({city: this.searchKey})
            // .then(result=>{
            //     return getW({city:this.searchKey});
            //})
            .then(result=>{
                this.weather = result;
                this.imageURL = result.Image__c;
                console.log('success');
            })
            .catch(error =>
                this.dispatchEvent (
                        new ShowToastEvent ({
                            title: 'Error',
                            variant: 'error',
                            message: 'Please enter valid city',
                        })
                ));
        this.weather = null;
    }
    handleChange(event) {
        this.searchKey = event.target.value;
        console.log(this.searchKey);
    }
}