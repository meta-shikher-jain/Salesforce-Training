public class ContactStore
{
   public static void storeContact(Id contactId)
   {
       Contact contact = [ SELECT accountid from Contact where id = :contactId ];
       Account contactIdsOfAccount = [SELECT Id,ContactID__c FROM account where Id = :contact.AccountId];
       
       if(contactIdsOfAccount.ContactID__c == null)
       {
           List<Contact> contactIdList = [ SELECT id from contact where accountid = :contactIdsofAccount.id ];
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
