@IsTest public class StatusIsChangedTest {

    @IsTest static void testCustomStatusChangedToReset(){
        
        Class__c classRecord= new Class__c(MaxSize__c = 20, Name = 'Program',Custom_Status__c = 'New');
        insert classRecord;
        Student__c studentData = new Student__c(First_Name__c = 'Test Name ', LastName__c = 'LastName', 
                                                Sex__c = 'Female',Class_object__c = classRecord.Id);
        insert studentData;
        
        classRecord.Custom_Status__c = 'Reset';
        update classRecord;
        
        System.assertEquals(0,[Select count() from Student__c where Class_object__c =:classRecord.id]);
        
    }
    
    
}