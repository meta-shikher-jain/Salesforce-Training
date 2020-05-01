@IsTest
public class UpdateOfOpportunityTest {
	
    @IsTest static void testOpportunityUpdateManagerField(){
        // Given
        List<Contact> contactList = TestFactoryDataForAccountAndContact.createAccountsWithContacts(1,1);
        Opportunity opp = new Opportunity(Name='Opportunity Test',StageName='Prospecting',CloseDate=System.today().addMonths(1));
        insert opp;
        // When
        Test.startTest();
        opp.BillToContact__c = contactList[0].Id;
        update opp;
        Test.stopTest();
        Opportunity updatedOpp = [SELECT Manager__c FROM Opportunity];
        // Then
        System.assertEquals(contactList[0].AccountId, updatedOpp.Manager__c);
    }
}