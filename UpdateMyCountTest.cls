@IsTest public class UpdateMyCountTest {

    @IsTest static void testUpdateCountOnStudentInsertion(){
		Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 5);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, 
                                                    Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        
        insert studentList;
        
        Class__c outputClassDataOnInsert = [SELECT MyCount__c From Class__c WHERE Id = : classRecord.Id];
        System.assertEquals(4, outputClassDataOnInsert.MyCount__c);
    }
}