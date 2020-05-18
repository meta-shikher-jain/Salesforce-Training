trigger SendEmailToOpportunityOwnerUsingTemplate on Opportunity (before update) {
    
   for(Opportunity oppRecord : trigger.new){
            if(oppRecord.StageName != trigger.oldMap.get(oppRecord.Id).StageName){
                 EmailToOpportunityOwner.StatusIsChanged(Trigger.new);
             }
        }
}

