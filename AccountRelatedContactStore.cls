public class AccountRelatedContactStore
{
   public static void StoreContact(Id contactId)
   {
       Account contactIdsOfAccount = [SELECT Id,ContactID__c FROM Account WHERE Id IN (SELECT AccountId FROM Contact where Id = :contactId)];
       if(contactIdsOfAccount.ContactID__c == null)
       {
           List<Contact> contactIdList = [ SELECT Id FROM Contact WHERE Accountid = :contactIdsofAccount.Id ];
           String contactIdsEntry = '';
           for(Contact contactObject: contactIdList)
           {
               contactIdsEntry = contactIdsEntry + contactObject.id + ',';
           }
           contactIdsOfAccount.ContactID__c = contactIdsEntry.removeEnd(',');
       }
       else
       {
           if( !( contactIdsOfAccount.ContactID__c.contains(contactId) ) )
           {
               contactIdsOfAccount.ContactID__c = contactIdsofAccount.ContactID__c + ',' + contactId;
           }
       }
       update contactIdsOfAccount;
   }

}
