public with sharing class BearController {
    @AuraEnabled(Cacheable=true)
    public static Employee__c[] getAllBears() {
        return [SELECT Id, Name,Employee_Name__c,Functional_Role__r.Name,Mentor__r.Name
            FROM Employee__c ORDER BY Name LIMIT 50];
    }

    @AuraEnabled(Cacheable=true)
    public static Employee__c[] searchBears(String searchTerm) {
        // Return all bears when no search term
        searchTerm = searchTerm.trim();
        if (searchTerm == '') {
            return getAllBears();
        }
        // Prepare query paramters
        searchTerm = '%'+ searchTerm +'%';
        // Execute search query
        return [SELECT Id, Name,Employee_Name__c,Functional_Role__r.Name,Mentor__r.Name
        FROM Employee__c WHERE Name LIKE :searchTerm ORDER BY Name LIMIT 50];
    }
    
}
