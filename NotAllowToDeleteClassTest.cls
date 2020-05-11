@IsTest
public class NotAllowToDeleteClassTest {

    @isTest 
    static void testMoreThanOneFemale_FourFemaleInserted_ErrorThrown(){
        //Given
        Class__c classRecord = new Class__c(Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i,
                                                    Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        //When
        insert studentList;
        try{
            Test.startTest();
            Database.delete(classRecord);
            Test.stopTest();
        }
        catch(DmlException ex){
            //Then
            System.assertEquals('Cannot delete class as it has more than one female students', ex.getDmlMessage(0));

        }
    }
    
    @IsTest 
    static void testWithMaleStudents_FourMaleInserted_SizeIsZero(){
        //Given
        Class__c classRecord = new Class__c(Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i,
                                                    Sex__c = 'Male',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        //When
        insert studentList;
        Test.startTest();
        delete classRecord;
        Test.stopTest();
        //Then
        System.assertEquals(0,[Select count() from Class__c]);
    }
}
