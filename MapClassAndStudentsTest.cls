@IsTest
public class MapClassAndStudentsTest {

    @isTest
   	static void testTClassIdwithStudent_Id_StudentName() {
       
       Map<Class__c, Set<Id>> expected = new Map<Class__c, Set<Id>>();
       List<Class__c> classList = new List<Class__c>();
       List<Student__c> studentList = new List<Student__c>();
       for(Integer i = 1; i <= 2; i++) {
           Class__c newClass = new Class__c(Name = 'Class ' + i);
           classList.add(newClass);
       }
       insert classList;
       
       for(Class__c cls : classList) {
           for(Integer j = 1; j <= 2; j++) {
               Student__c student = new Student__c(LastName__c = cls.Name + 'St' + j, Class_object__c = cls.Id);
               studentList.add(student);
           }

       }
       insert studentList;
   
       for(Class__c cls : classList) {
           Set<Id> studentIds = new Set<Id>();
           for(Student__c student : studentList ) {
               if(student.Class_object__c == cls.id){
                   studentIds.add(student.Id);
               }
           }		
           expected.put(cls,studentIds);
       }
       Map<Class__c,Set<Id>> result = Utility.StudentIdWithNames();
       System.assertEquals(result.keyset().size(),2);
   }
}
