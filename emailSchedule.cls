global class emailSchedule implements Schedulable {
	
     public void execute (SchedulableContext ctx){
       List<Opportunity> opptys = [SELECT Id, Name, Owner.Email,CloseDate FROM Opportunity
           							WHERE LastModifiedDate < LAST_N_DAYS:10];
	   
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       for(Opportunity oppty : opptys){
          	System.debug('Name    :  '+oppty.Name+' Email : '+oppty.Owner.Email);
           	String[] toAddresses = new String[] {oppty.Owner.Email};
               
           	mail.setToAddresses(toAddresses);
			mail.setSubject('Subject!!');
    		mail.setPlainTextBody('Hello String');
			Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
   		    break;
      	}    
	}
}