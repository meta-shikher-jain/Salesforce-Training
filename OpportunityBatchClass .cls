public class OpportunityBatch {
public static void checkBillToContact(List<Opportunity> opportunityList)
   {
       List<Opportunity> FilteredList = new List<Opportunity>();
       for(Opportunity opp : opportunityList)
       {
           if(opp.BillToContact__c != null && opp.Manager__c == null)
           {
                   FilteredList.add(opp);
           }
       }
       Map<Id, Opportunity> contactIdAndOpportunity_map = new map<Id,Opportunity>();
       for(Opportunity opps : FilteredList)
       {
           contactIdAndOpportunity_map.put(opps.BillToContact__c,opps);
       }
       List<Contact> contacts = [Select Id,AccountId from Contact where Id in :contactIdAndOpportunity_map.keySet()];
       for(Contact cont : contacts)
       {
           Opportunity opp = contactIdAndOpportunity_map.get(cont.Id);
           opp.Manager__c = cont.AccountId;
       }
       
   }
}
