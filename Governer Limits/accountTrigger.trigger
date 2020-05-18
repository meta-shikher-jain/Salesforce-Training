trigger accountTrigger on Account (before delete, before insert, before update, after delete, after insert, after update) {
    If(Trigger.IsBefore){
        If(Trigger.IsInsert || Trigger.IsUpdate){
            accountTriggerHelper.accountTestTriggerMethod(Trigger.new);           
        }
    }
    If(Trigger.IsAfter){
        If(Trigger.IsInsert || Trigger.IsUpdate || Trigger.IsDelete){
            accountTriggerHelper.accountLimitExample(Trigger.newMap);
        }
    }
    If(Trigger.IsDelete || Trigger.IsInsert || Trigger.IsUpdate){
        accountTriggerHelper.accountOpportunityStageMethod(Trigger.newMap);
    }
}