public class NotAllowedClass {

    public static void MoreThanOne(List<Class__c> oldList, Map<Id,Class__c> oldMap){
        AggregateResult[] stList = [SELECT Class_object__c, COUNT(Name) FROM Student__c GROUP BY 
                                    		Class_object__c HAVING COUNT(Class_object__c) >= 1];
        Set<Id> classIds = new Set<Id>();
        for(AggregateResult ar : stList){
            classIds.add((Id)ar.get('Class_object__c'));
        }
        
        for(Id i:classIds){
            
           oldMap.get(i).addError('Cannot delete class as it has more than 2 female students');
       	}
        
    }
}