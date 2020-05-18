@isTest
private class Email_Opportunity_StatusUpdatedTest
{
    @isTest
    static void testEmailWhenStatusIsUpdated()
    {	//Given
        List<Opportunity> listOf = new List<Opportunity>();
        Opportunity oppt = new Opportunity(StageName = 'Prospecting',Name = 'Shikehr',CloseDate=System.today());
     	insert oppt;
     	//When
        oppt.StageName = 'Qualification';
        Test.StartTest();
     	update oppt;
        Integer invocations = Limits.getEmailInvocations();
        Test.StopTest();
        //Then
        System.assertEquals(2, invocations, 'An email has not been sent');
    }
}