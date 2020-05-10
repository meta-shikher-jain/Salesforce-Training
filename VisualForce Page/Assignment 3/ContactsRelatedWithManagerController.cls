public class ContactsRelatedWithManagerController {

    public Id oppId{get; set;}
    public List<Contact> contactList{get; set;}
    public string contactRecord{get; set;}
    
    public List<SelectOption> getRelatedContacts(){
       	List<SelectOption> option = new List<SelectOption>();
		oppId =	apexpages.currentpage().getparameters().get('id');
        contactList = [SELECT Id,Name FROM Contact WHERE AccountId in (SELECT Manager__c FROM opportunity where Id=:oppId)] ;  
            
       for(Contact cont : contactList){
            option.add(new SelectOption(cont.Id,cont.Name));
        }
        return option;       
     }
    
    public PageReference Save(){
        Opportunity oppObj = [SELECT BillToContact__c FROM Opportunity WHERE id=:oppId ];
        if(contactRecord != null){
            oppObj.BillToContact__c = contactRecord;
            update oppObj;
		}
        PageReference pageredirect = new PageReference('/'+oppId);
        pageredirect.setRedirect(true);
        return pageredirect;
    }
    
    public PageReference Cancel(){
        PageReference pageredirect = new PageReference('/'+oppId);
        pageredirect.setRedirect(true);
        return pageredirect;
    }
    
    public PageReference Clear(){
        Opportunity oppObj = [SELECT BillToContact__c FROM Opportunity WHERE id = :oppId ];
        oppObj.BillToContact__c = null;
        update oppObj;
        PageReference pageredirect = new PageReference('/'+oppId);
        pageredirect.setRedirect(true);
        return pageredirect; 
    }    
}
