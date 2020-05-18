public class EmailToOpportunityOwner {
    
    public static void StatusIsChanged(List<Opportunity> emailopportunityList)
    {
        List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
        EmailTemplate emailTemplateRecord = [SELECT Id FROM EmailTemplate WHERE DeveloperName LIKE 'OpportunityUpdateEmailTemplate' LIMIT 1]; 
        List<Opportunity> opportunityList = [SELECT Id,Name,Owner.Email FROM Opportunity Where Id in:emailopportunityList];
        for(Opportunity opportunityRecord: opportunityList)
        {
            Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(emailTemplateRecord.Id, opportunityRecord.OwnerId, opportunityRecord.Id);
            mail.setToAddresses(new List<String>{opportunityRecord.Owner.Email});
            mail.setSaveAsActivity(false);
            allmsg.add(mail);
        }
        try {
            Messaging.sendEmail(allmsg,true);
            return;
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
    }  
}