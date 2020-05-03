trigger LoanUpdateTrigger on Loan__c (before insert) {
  String city = null;
  for(Loan__c  obj : trigger.new)
   {
     if(obj.City__c != null){
         city = obj.City__c;
       }
    }
  if(city != null){
     
      try {
           CityManager__c managerCity = [Select Manager__c from CityManager__c where city__c=: city];
           for(Loan__c  obj : trigger.new)
           {
             if(obj.City__c != null)
                 obj.Manager__c = managerCity.Manager__c;
           }
      } catch (Exception e) {
          
      }
  }
}
