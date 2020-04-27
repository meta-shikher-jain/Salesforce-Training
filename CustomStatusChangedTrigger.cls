trigger CustomStatusChangedTrigger on Class__c (after update) {
  
    CustomStatusChanged.ValueChangedToReset(trigger.new,trigger.oldmap);
     
    
}