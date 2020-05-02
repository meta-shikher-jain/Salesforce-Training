@istest
public class MapClassAndStudentsTest {

    @isTest
   	static void testToMapClassIdwithStudent() {
       
       Map<Class__c, Set<Id>> expected = new Map<Class__c, Set<Id>>();
       List<Class__c> cList = new List<Class__c>();
       List<Student__c> stList = new List<Student__c>();
       for(Integer i = 1; i <= 2; i++) {
           Class__c newClass = new Class__c(Name = 'Class ' + i);
           cList.add(newClass);
       }
       insert cList;
       
       for(Class__c cls : cList) {
           for(Integer j = 1; j <= 2; j++) {
               Student__c student = new Student__c(LastName__c = cls.Name + 'St' + j, Class_object__c = cls.Id);
               stList.add(student);
           }

       }
       insert stList;
   
       for(Class__c cls : cList) {
           Set<Id> studentIds = new Set<Id>();
           for(Student__c student : stList ) {
               if(student.Class_object__c == cls.id){
                   studentIds.add(student.Id);
               }
           }		
           expected.put(cls,studentIds);
       }
       Map<Class__c,Set<Id>> result = UtilityClassOfVariousFunctions.StudentIdWithNames();
       System.assertEquals(result.keyset().size(),2);
         
   }
}
