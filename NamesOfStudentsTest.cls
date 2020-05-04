@IsTest
public class NamesOfStudentsTest {

    @IsTest static void testCountStudentsWithClassId(){
        Class__c classRecord = new Class__c(Name = 'Maths',MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(integer i=0; i<10; i++){
            Student__c student = new Student__c(Class_object__c = classRecord.Id, Name = 'Shikher'+ i);
            studentList.add(student);
        }
        
        insert studentList;
        Test.startTest();
        List<String> studentsList = Utility.getStudentNameListByClassId(classRecord.id);
        System.assertEquals(10,studentsList.size());
        test.stopTest();
    }
    
    @IsTest static void testCountStudentsWithClassIdNegativeCase(){
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
        Test.startTest();
        List<String> studentsList = Utility.getStudentNameListByClassId(classRecordTest.id);
        System.assertEquals(0,studentsList.size());
        test.stopTest();
    }
    
    
}
