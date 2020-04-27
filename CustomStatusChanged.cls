public class CustomStatusChanged {

    public static void ValueChangedToReset(List<Class__c> oldList,Map<Id,Class__c> oldMap){
        
        Set<Id> opptIds = new Set<Id>();
       for(Class__c cls : oldList){
          if(cls.Custom_Status__c == 'Reset'){
              opptIds.add(cls.Id);
          }
       }
        
        Set<Id> setOfIds = new Set<Id>();
        for(Id ids :opptIds){
            if(oldMap.get(ids).Custom_Status__c != 'Reset'){
        setOfIds.add(ids);                
            }
        }
         
       delete [Select Id from Student__c where Class_object__c in : setOfIds ];        

     }
}