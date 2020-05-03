trigger updateTrigger on Opportunity (before insert, before update) {
    
   OpportunityClassForUpdatingManager.checkBillToContact(Trigger.new);
}
