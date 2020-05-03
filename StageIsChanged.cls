public class StageIsChanged {
    public static void updateCloseDateFieldWithToday(Map<Id,Opportunity> newOpportunityMap, Map<Id,Opportunity> oldOpportunityMap){
        for(Opportunity oppRecord : newOpportunityMap.values()){
            if(oppRecord.StageName != oldOpportunityMap.get(oppRecord.Id).StageName){
                if(oppRecord.StageName == 'Closed Won' || oppRecord.stageName == 'Closed Lost')
                    oppRecord.CloseDate = system.today();    
             }
        }
    }
}
