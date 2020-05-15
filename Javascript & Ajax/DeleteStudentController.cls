public with sharing class DeleteStudentController {
    
	@RemoteAction
    public static void DeleteStudents(List<String> StudentIds){
        Student__c students = [SELECT Id FROM Student__c WHERE id In : StudentIds];
        try{
            delete students;
        }
        catch(Exception e){
            apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
    }
}