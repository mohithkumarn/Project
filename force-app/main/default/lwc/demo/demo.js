import { LightningElement, api, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import ADDRESS_FIELD from '@salesforce/schema/Employee__c.Functional_Role__r.Name';

export default class demo extends LightningElement {
@track mapMarkers;
@track zoomLevel;
@track record;

    @api recordId;
    @wire(getRecord, { recordId: '$recordId', fields: [ADDRESS_FIELD] })
    wiredProject({ error, data }) {
        if (data) {
            this.record = data;
            console.log(JSON.stringify(this.record));
            this.mapMarkers = [
               {
                   location: {
                       Street: this.record.fields.Address__c.value,
                       City: 'Washington',
                       State: 'DC',
                   },
               },
           ];
           this.zoomLevel = 5;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }
}