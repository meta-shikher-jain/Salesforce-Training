@IsTest
public class TeachTriggerTest {
    @IsTest static void testTeacherNotAllowIfHindiSub(){
        Contact con = new Contact(FirstName ='firstname Contact ',
                                  LastName = ' lastname Contact ');
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert con;
        insert classRecord;
        Teach__c teachRecord = new Teach__c(Class__c = classRecord.Id, Teacher__c = con.Id,Subjects__c = 'Hindi');
        try {
            insert teachRecord; 
        }
        catch(DmlException ex){
            System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION,ex.getDmlType(0));
            System.assertEquals('You cant add teacher with subject teaching hindi', ex.getDmlMessage(0));
        }
    }
   
    @IsTest static void testTeacherAllowedIfEnglishSub(){
        Contact con = new Contact(FirstName ='firstname Contact ',
                                  LastName = ' lastname Contact ');
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert con;
        insert classRecord;
        Teach__c teachRecord = new Teach__c(Class__c = classRecord.Id, Teacher__c = con.Id,Subjects__c = 'English');
        insert teachRecord; 
        Integer noOfTeacher = [SELECT Count() FROM Teach__c]
        System.assertEquals(1, noOfTeacher);
        teachRecord.Subjects__c = 'Hindi';
        try {
            update teachRecord;
        }
        catch(DmlException ex){
            System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION,ex.getDmlType(0));
            System.assertEquals('You cant add teacher with subject teaching hindi', ex.getDmlMessage(0));
        }
    }
}
