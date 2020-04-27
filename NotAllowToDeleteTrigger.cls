trigger NotAllowToDeleteTrigger on Class__c (before delete) {

        NotAllowedClass.MoreThanOne(trigger.new,trigger.oldmap);    
 
}