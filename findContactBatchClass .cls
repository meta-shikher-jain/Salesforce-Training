global class findContactBatchClass implements Database.Batchable <sObject> {
    Account account;
    String contactId;
    
    global findContactBatchClass(Contact contact,String contactId){
        this.account = account;
        this.contactId = contactId;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id FROM Contact WHERE AccountId =: contactId]);
    }
    
    global void execute(Database.BatchableContext bc,List<Contact> contacts){
        String commaSeprateList ='';
        if(account.ContactID__c == null){
            for(Contact c:contacts){
                commaSeprateList += c.Id+',';
            }
            Account.ContactID__c = commaSeprateList;
            update account;
        }
        else{
            List<string> listOfContactIds = account.ContactID__c.split(',');
            Contact con = [SELECT Id from Contact WHERE Id =:contactId ];
            if(!ListOfContactIds.contains(con.Id)){
                account.ContactID__c +=''+con.Id;
                update account;
            }
        }
    }
    
    global void finish(Database.BatchableContext bc){
        
    }

}