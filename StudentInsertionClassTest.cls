@IsTest
public class StudentInsertionClassTest {

    @IsTest static void PositivetestStudentNotAllowedIfLimitExceed(){
        // Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 3);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, 
                                                    Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        // When
        try{
            insert studentList;
        }
        // Then
        catch(DmlException ex){
            System.assertEquals('Cannot insert Record - Class is full', ex.getDmlMessage(0));
        }
    }
    
    @IsTest static void NegativetestStudentNotAllowedIfLimitExceed(){
        // Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 5);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, 
                                                    Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        // When
        insert studentList;
        // Then
        System.assertEquals(4, [SELECT Count() From Student__c WHERE Class_object__c = : classRecord.Id]);
    }
}