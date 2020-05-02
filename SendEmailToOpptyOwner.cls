global class SendEmailToOpptyOwner implements Database.Batchable<sObject>
{
  global Database.QueryLocator start(Database.BatchableContext BC)
  {
    return Database.getQueryLocator('SELECT Id, Name, Owner.Email, Owner.name FROM Opportunity WHERE LastModifiedDate > LAST_N_DAYS:30');
  }

  global void execute(Database.BatchableContext BC, List<Opportunity > listOfOpportunity)
  {
	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	for(Opportunity opp : listOfOpportunity)
    	{  
	   if(opp.Owner.Email == null){
	    	System.addError('Owners Email Does not Exist ');
	   }	
	   else{
	   	String[] toAddresses = new String[] {opp.Owner.Email};
	 	mail.setToAddresses(toAddresses);
          	mail.setPlainTextBody('Test');
	   	mail.setSubject('Not Modified from 30 days');
           	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });	
	   }
    	}
  }
  global void finish(Database.BatchableContext BC){
  }
}
