public class opportunityBatchClass {
    
    public static void checkBillToContact(List<Opportunity> opportunityList){
        
        List<Opportunity> allOpportunity = [Select Name, Id,BillToContact__c FROM Opportunity 
                                            WHERE BillToContact__c != null AND Manager__c = null];
      
        List<Opportunity> managerUpdateList = new List<Opportunity>();
        for(Opportunity opp : allOpportunity){
            opp.Manager__c = opp.BillToContact__c;
            managerUpdateList.add(opp);
        }
        update ManagerUpdateList;
     }
}