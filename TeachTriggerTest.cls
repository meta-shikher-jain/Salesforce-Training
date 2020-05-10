@IsTest
public class TeachTriggerTest {
    @IsTest 
    static void testTeacherNotAllowIfHindiSub_TeacherWithHindiSubject_ErrorGenerated(){
        //Given
        Contact con = new Contact(FirstName ='firstname Contact ',
                                  LastName = ' lastname Contact ');
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert con;
        insert classRecord;
        Teach__c teachRecord = new Teach__c(Class__c = classRecord.Id, Teacher__c = con.Id,Subjects__c = 'Hindi');
        //When
        try {
            insert teachRecord; 
            System.assert(false, 'A error expected');
        }
        //Then
        catch(DmlException ex){
            System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION,ex.getDmlType(0));
            System.assertEquals('You cant add teacher with subject teaching hindi', ex.getDmlMessage(0));
        }
    }
   
    @IsTest 
    static void testTeacherAllowedIfEnglishSub_TeacherWithEnglishSubjectAndUpdated_ErrorExpected(){
        //Given
        Contact con = new Contact(FirstName ='firstname Contact ',
                                  LastName = ' lastname Contact ');
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert con;
        insert classRecord;
        Teach__c teachRecord = new Teach__c(Class__c = classRecord.Id, Teacher__c = con.Id,Subjects__c = 'English');
        insert teachRecord; 
        System.assertEquals(1, [SELECT Count() FROM Teach__c]);
        teachRecord.Subjects__c = 'Hindi';
       	//When
        try {
            update teachRecord;
        }
        //Then
        catch(DmlException ex){
            System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION,ex.getDmlType(0));
            System.assertEquals('You cant add teacher with subject teaching hindi', ex.getDmlMessage(0));
        }
    }
}
