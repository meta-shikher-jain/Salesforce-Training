@IsTest
public class LoanStatusChangedEmailSentTest {

   @isTest
    static void testEmailWhenLoanStatusIsUpdated()
    {	//Given
        CityManager__c cityManager = new CityManager__c(City__c = 'Jaipur');
        List<Loan__c> listOfLoans = new List<Loan__c>();
        Loan__c loan = new Loan__c(City__c = cityManager.id);
     	insert loan;
     	//When
        loan.Loan_Status__c = 'Approved';
        Test.StartTest();
     	update loan;
        Integer invocations = Limits.getEmailInvocations();
        Test.StopTest();
        //Then
        System.assertEquals(1, invocations, 'An email has not been sent');
    }
}