@IsTest public class StageChangeTest {

    @Istest static void testStageChangedToCloseWon(){
        Opportunity opp = new Opportunity(Name='Opportunity Test',StageName='Prospecting',CloseDate=System.today().addMonths(1));
        insert opp;
        opp.StageName = 'Closed Won';
        
        update opp;
        Opportunity updatedOpp = [SELECT CloseDate FROM Opportunity];
	System.assertEquals(updatedOpp.CloseDate,System.today());
    }
    
    @Istest static void testStageChangedToCloseLost(){
        Opportunity opp = new Opportunity(Name='Opportunity Test',StageName='Prospecting',CloseDate=System.today().addMonths(1));
        insert opp;
        opp.StageName = 'Closed Lost';
        
        update opp;
        Opportunity updatedOpp = [SELECT CloseDate FROM Opportunity];
	System.assertEquals(updatedOpp.CloseDate,System.today());
    }
    
    @Istest static void testFromClosedLostToClosedLost(){
        Opportunity opp = new Opportunity(Name='Opportunity Test',StageName='Closed Lost',CloseDate=System.today().addMonths(1));
        insert opp;
        opp.StageName = 'Closed Lost';
        
        update opp;
        Opportunity updatedOpp = [SELECT CloseDate FROM Opportunity];
	System.assertEquals(updatedOpp.CloseDate,System.today().addMonths(1));
    }
}
