@IsTest
public class NamesOfStudentsTest {

    @IsTest 
    static void testCountStudentsWithClassId_TenStudents_NoOfStudentIsTen(){
        //Given
        Class__c classRecord = new Class__c(Name = 'Maths',MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(integer i=0; i<10; i++){
            Student__c student = new Student__c(Class_object__c = classRecord.Id, Name = 'Shikher'+ i);
            studentList.add(student);
        }
        
        insert studentList;
        //When
        Test.startTest();
        List<String> studentsList = Utility.getStudentNameListByClassId(classRecord.id);
        //Then
        System.assertEquals(10,studentsList.size());
        Test.stopTest();
    }
    
    @IsTest 
    static void testCountStudentsWithClassId_InsertTenStudents_NoStudents(){
        //Given
        Class__c classRecord = new Class__c(Name = 'Maths',MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(integer i=0; i<10; i++){
            Student__c student = new Student__c(Class_object__c = classRecord.Id, Name = 'Shikher'+ i);
            studentList.add(student);
        } 
        insert studentList;
        Class__c classRecordTest = new Class__c(Name = 'Computer', MAxSize__c = 5);
        insert classRecordTest;
        //When
        Test.startTest();
        List<String> studentsList = Utility.getStudentNameListByClassId(classRecordTest.id);
        //Then
        System.assertEquals(0,studentsList.size());
        Test.StopTest();
    }
}
