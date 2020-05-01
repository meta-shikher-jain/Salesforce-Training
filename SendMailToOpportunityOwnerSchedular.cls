global class SendMailToOpportunityOwnerSchedular implements Schedulable {
   global void execute(SchedulableContext sc) {
      SendEmailToOpptyOwner obj = new SendEmailToOpptyOwner();
      database.executebatch(obj);
   }
}
