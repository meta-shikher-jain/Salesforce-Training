public with sharing class JSONGenerator {

    public string jsonStr {private set;get;}
    
    public JSONGenerator(){
        jsonStr = prepareJSON();
    }
    
    private string prepareJSON(){
        List<Student__c> studentRecord = [SELECT id,Name,First_Name__c,DOB__c,Sex__c FROM Student__c];
		return JSON.serialize(studentRecord);
    }
}