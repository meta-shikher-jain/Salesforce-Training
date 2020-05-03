@IsTest
public class NotAllowToDeleteClassTest {

    @isTest static void testMoreThanOneFemale(){
        Class__c classRecord = new Class__c(Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i,
                                                    Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        Class__c classRecord1 = new Class__c(Fee__c = 1000, MaxSize__c = 10);

        List<Class__c> c = new List<Class__c>();
        c.add(classRecord);
        
        try{
            test.startTest();
            Database.delete(c);
        }
        catch(DmlException ex){
            System.assertEquals('Cannot delete class as it has more than one female students', ex.getDmlMessage(0));

        }
    }
    
    @IsTest static void testWithMaleStudents(){
        Class__c classRecord = new Class__c(Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i,
                                                    Sex__c = 'Male',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        
        delete classRecord;
        System.assertEquals(0,[Select count() from Class__c]);
    }
}
