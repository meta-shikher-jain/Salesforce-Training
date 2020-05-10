@IsTest public class StageChangeTest {

    @Istest 
    static void testStageChangedFromProspectingToCloseWon_TodaysDate(){
        //Given
        Opportunity opp = new Opportunity(Name='Opportunity Test',StageName='Prospecting',CloseDate=System.today().addMonths(1));
        insert opp;
        //When
        opp.StageName = 'Closed Won';
        update opp;
        Opportunity updatedOpp = [SELECT CloseDate FROM Opportunity];
        //Then
		System.assertEquals(updatedOpp.CloseDate,System.today());
    }
    
    @Istest 
    static void testStageChangedFromProspectingToCloseLost_TodaysDate(){
        //Given
        Opportunity opp = new Opportunity(Name='Opportunity Test',StageName='Prospecting',CloseDate=System.today().addMonths(1));
        insert opp;
        //When
        opp.StageName = 'Closed Lost';
        update opp;
        Opportunity updatedOpp = [SELECT CloseDate FROM Opportunity];
        //Then
		System.assertEquals(updatedOpp.CloseDate,System.today());
    }
    
    @Istest 
    static void testFromClosedLostToClosedLost_CloseDateRemainsSame(){
       	//Given
        Opportunity opp = new Opportunity(Name='Opportunity Test',StageName='Closed Lost',CloseDate=System.today().addMonths(1));
        insert opp;
        opp.StageName = 'Closed Lost';
       	//When
        update opp;
        Opportunity updatedOpp = [SELECT CloseDate FROM Opportunity];
        //Then
		System.assertEquals(updatedOpp.CloseDate,System.today().addMonths(1));
    }
    
    @IsTest
    static void testFromClosedLostToProposal/Price Quote_CloseDateRemainsSame(){
        //Given
        Opportunity opp = new Opportunity(Name='Opportunity Test',StageName='Closed Lost',CloseDate=System.today().addMonths(1));
        insert opp;
        //When
        opp.StageName = 'Proposal/Price Quote';
        update opp;
        Opportunity updatedOpp = [SELECT CloseDate FROM Opportunity];
        //Then
		System.assertEquals(updatedOpp.CloseDate,System.today().addMonths(1));
    }
}
