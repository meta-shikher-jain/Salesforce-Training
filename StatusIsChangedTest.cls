@IsTest public class StatusIsChangedTest {

    @IsTest static void testCustomStatusChangedToReset(){
        
        Class__c classRecord= new Class__c(MaxSize__c = 20, Name = 'Program',Custom_Status__c = 'New');
        insert classRecord;
        Student__c studentData = new Student__c(First_Name__c = 'Test Name ', LastName__c = 'LastName', 
                                                Sex__c = 'Female',Class_object__c = classRecord.Id);
        insert studentData;
        classRecord.Custom_Status__c = 'Reset';
        test.startTest();
        update classRecord;
        test.stopTest();
        System.assertEquals(0,[Select count() from Student__c where Class_object__c =:classRecord.id]);
    }
    
    
    @IsTest static void negativeTestDeleteRelatedStudentsWhenReset(){
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Male',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        classRecord.Custom_Status__c = 'Open';
        update classRecord;
        System.assertEquals(4, [SELECT Count() FROM Student__c WHERE Class_object__c = : classRecord.Id]);
    }
    
   		
    
    
}
