public class accountTriggerHelper {
    
    public static void accountTestTriggerMethod(List<Account> accountList){
        List<Contact> contacts = [SELECT Id, Salutation, Firstname, Lastname, Email FROM Contact WHERE AccountId IN : accountList];
        for(Contact c: contacts) {
            System.debug('Contact Id[' + c.Id + '], FirstName[' + c.firstname + '], LastName[' + c.lastname +']');
            c.Description = c.Salutation + ' ' + c.FirstName + ' ' + c.Lastname;
        }
        update contacts;
    }
    public static void accountOpportunityStageMethod(Map<Id,Account> accountMap){
        List<Opportunity> opptys = [SELECT Id, Name, Closedate, Stagename FROM Opportunity 
                                              WHERE AccountId IN :accountMap.keySet() AND (StageName='Closed - Lost' OR StageName='Closed - Won')];
            for(Opportunity opp : opptys){
                if(opp.StageName == 'Closed - Lost'){
                    System.debug('Do more logic here...');
                }
                else if(opp.StageName == 'Closed - Won'){
                    System.debug('Do more logic here...');
                }
            }
    }
  
    public static void accountLimitExample(Map<Id,Account> accountMap){
        System.debug('Total Number of SOQL Queries allowed in this Apex code context: ' + Limits.getLimitQueries());
        System.debug('Total Number of records that can be queried in this Apex code context: ' + Limits.getLimitQueryRows());
        System.debug('Total Number of DML statements allowed in this Apex code context: ' + Limits.getLimitDMLStatements());
        System.debug('Total Number of CPU usage time (in ms) allowed in this Apex code context: ' + Limits.getLimitCpuTime());
        
        // Query the Opportunity object
        List<Opportunity> opptys = [SELECT Id, Description, Name, Accountid, Closedate, Stagename FROM Opportunity 
                                    WHERE AccountId IN : accountMap.keySet()];
        System.debug('1. Number of Queries used in this Apex code so far: ' + Limits.getQueries());
        System.debug('2. Number of rows queried in this Apex code so far: ' + Limits.getQueryRows());
        System.debug('3. Number of DML statements used so far: ' + Limits.getDMLStatements());
        System.debug('4. Amount of CPU time (in ms) used so far: ' + Limits.getCpuTime());
        if (opptys.size() + Limits.getDMLRows() > Limits.getLimitDMLRows()) {
            System.debug('Need to stop processing to avoid hitting a governor limit. Too many related Opportunities to update in this trigger');
            System.debug('Trying to update ' + opptys.size() + ' opportunities but governor limits will only allow ' + Limits.getLimitDMLRows());
            for (Account a : accountMap.Values()) {
                a.addError('You are attempting to update the addresses of too many accounts at once. Please try again with fewer accounts.');
            }
        }
        else{
            System.debug('Continue processing. Not going to hit DML governor limits');
            System.debug('Going to update ' + opptys.size() + ' opportunities and governor limits will allow ' + Limits.getLimitDMLRows());
        }
        for(Account a : accountMap.Values()){
            System.debug('Number of DML statements used so far: ' +  Limits.getDmlStatements());
            for(Opportunity o: opptys){
                if (o.accountid == a.id)
                    o.description = 'testing';
            }
        }
        update opptys;
        System.debug('Final number of DML statements used so far: ' + Limits.getDmlStatements());
        System.debug('Final heap size: ' + Limits.getHeapSize());
    }
}