@IsTest
public class NamesOfStudentsTest {

    @IsTest static void testNameOfStudentsInClassWithClassID(){
        Class__c c = new Class__c();
        c.Name = 'Maths';
        c.MaxSize__c = 10;
        insert c;
       	
        List<Student__c> studentList = new List<Student__c>();
        for(integer i=0; i<10; i++){
			Student__c student = new Student__c(Class_object__c = c.Id, Name = 'Shikher'+ i);
            studentList.add(student);
        }
        
        insert studentList;
        
        Test.startTest();
        List<String> studentsList = ApexAssignment1.NameOfStudents(c.id);
        System.assertEquals(10,studentsList.size());
        test.stopTest();
    }
}