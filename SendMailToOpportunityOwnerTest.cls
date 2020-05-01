@IsTest
public class SendMailToOpportunityOwnerTest {

    @testsetup
    static void setup(){
        List<Opportunity> oppRecords = new List<Opportunity>();
		for(Integer i = 0; i < 10; i++){
            Opportunity opp = new Opportunity(Name = 'Test', StageName='Prospecting', CloseDate = date.newInstance(2020, 4, 28));
            oppRecords.add(opp);
        }
        insert oppRecords;
    }
    
    @IsTest
    static void testEmailSchedulerLastDateNotModifiedFromLastThirtyDays(){
        String CRON_EXP = '0 2 23 29 4 ? 2020';
		Test.startTest();
        // When
        System.schedule('ScheduledApexTest', CRON_EXP,new SendMailToOpportunityOwnerSchedular());   
        Test.stopTest();
        // Then
        System.assertEquals(10, [SELECT Count() FROM Opportunity]);
    }
}