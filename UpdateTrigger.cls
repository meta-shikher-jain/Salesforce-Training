trigger UpdateTrigger on Opportunity (before insert, before update) {
    
   OpportunityBatch.checkBillToContact(Trigger.new);
}
