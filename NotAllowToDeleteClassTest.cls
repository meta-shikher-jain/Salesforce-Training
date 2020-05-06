@IsTest
public class NotAllowToDeleteClassTest {
    // Positive Test case method to not allow to delete the class if having more than 2 female students
    @IsTest 
    static void positiveTestClassNotAllowedToDeleteTrigger(){
        // Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(FirstName__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        // When
        try {
            delete classRecord; 
        }
        // Then
        catch(DmlException ex){
            System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION,ex.getDmlType(0));
            System.assertEquals('Cannot delete class as it has more than one female students', ex.getDmlMessage(0));
        }
    }

    @IsTest 
    static void negativeTestClassNotAllowedToDeleteTrigger(){
        // Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Male',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        // When 
        delete classRecord;
        // Then
        Integer noOfStudent =[SELECT Count() FROM Class__c];
        System.assertEquals(0,noOfStudent);
    }

    @IsTest 
    static void positiveTestDeleteRelatedStudentsWhenReset(){
        // Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Male',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        // When 
        classRecord.Custom_Status__c = 'Reset';
        update classRecord;
        // Then
        // Test when the Custom Status field in class is Reset\
        Integer noOfStudent = [SELECT Count() FROM Student__c WHERE Class__c = : classRecord.Id];
        System.assertEquals(0,noOfStudent);
    }

    @IsTest 
    static void negativeTestDeleteRelatedStudentsWhenReset(){
        // Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Male',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        // When 
        classRecord.Custom_Status__c = 'Open';
        update classRecord;
        // Then
        // Test when the Custom Status field in class is Reset;
        Integer noOfStudent = [SELECT Count() FROM Student__c WHERE Class__c = : classRecord.Id];
        System.assertEquals(4, noOfStudent);
    }

    
}
