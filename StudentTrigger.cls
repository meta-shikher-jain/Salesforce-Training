trigger StudentTrigger on Student__c (after  insert, before insert, after delete, after undelete) {
    If(Trigger.IsBefore && Trigger.IsInsert){
        StudentTriggerHelper.StudentNotAllowedIfLimitExceed(Trigger.new);
    }
    If(Trigger.IsAfter){
        if(Trigger.IsInsert || Trigger.IsUndelete){
        	StudentTriggerHelper.updateMyCountOnClassOnStudentAddition(Trigger.new);
        }
        if(Trigger.IsDelete){
        	StudentTriggerHelper.updateMyCountOnClassOnStudentAddition(Trigger.old);
        }
    }
}
