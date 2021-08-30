public with sharing class taskcontroller {
    @AuraEnabled(Cacheable=true)
    public static Task_Assignments__c[] getAllBears() {
        return [SELECT Id,Name, Status__c,Due_Date__c,Duration__c,Tasks__r.Name,Employee__r.Name
            FROM Task_Assignments__c ORDER BY Name LIMIT 50];
    }
    @AuraEnabled(Cacheable=true)
    public static Task_Assignments__c[] searchBears(String searchTerm) {
        // Return all bears when no search term
        searchTerm = searchTerm.trim();
        if (searchTerm == '') {
            return getAllBears();
        }
        // Prepare query paramters
        searchTerm = '%'+ searchTerm +'%';
        // Execute search query
        return [SELECT Id,Name, Status__c,Due_Date__c,Duration__c,Tasks__r.Name,Employee__r.Name
        FROM Task_Assignments__c WHERE Name LIKE :searchTerm ORDER BY Name LIMIT 50];
    }
}
