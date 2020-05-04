public class NotAllowedToDeleteClass {

    public static void MoreThanOneFemale(Map<Id,Class__c> oldMap){
        AggregateResult[] stList = [SELECT Class_object__c FROM Student__c where Sex__c = 'Female' GROUP BY 
                                            Class_object__c HAVING COUNT(Class_object__c) >= 1];
        Set<Id> classIds = new Set<Id>();
        for(AggregateResult ar : stList){
            classIds.add((Id)ar.get('Class_object__c'));
        }
        
        for(Id i:classIds){
            
           oldMap.get(i).addError('Cannot delete class as it has more than one female students');
        }
        
    }
}
