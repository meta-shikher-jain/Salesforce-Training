@IsTest
public class StudentTriggerTest {
    @IsTest 
    static void PositivetestStudentNotAllowedIfLimitExceed(){
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 3);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        try{
            insert studentList;
            
        }
        catch(DmlException ex){
            System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION,ex.getDmlType(0));
            System.assertEquals('Cannot add student in class, class size is full.', ex.getDmlMessage(0));
        }
    }

    @IsTest static void NegativetestStudentNotAllowedIfLimitExceed(){
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 5);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        System.assertEquals(4, [SELECT Count() From Student__c WHERE Class_object__c = : classRecord.Id]);
    }

   
    @IsTest static void InserttestupdateMyCountOnClassOnStudentAddition(){
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i <4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        Class__c outputClassDataOnInsert = [SELECT MyCount__c From Class__c WHERE Id = : classRecord.Id];
        System.assertEquals(4, outputClassDataOnInsert.MyCount__c);
    }
   
    @IsTest static void DeletetestupdateMyCountOnClassOnStudentAddition(){
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 5);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        delete studentList[0];
        Class__c outputClassDataOnDelete = [SELECT MyCount__c From Class__c WHERE Id = : classRecord.Id];
        System.assertEquals(3, outputClassDataOnDelete.MyCount__c);
    }
    
    @IsTest static void UndeletetestupdateMyCountOnClassOnStudentAddition(){
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 5, MyCount__c = 1);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        delete studentList[0];
        undelete studentList[0];
        Class__c outputClassDataOnUndelete = [SELECT MyCount__c From Class__c WHERE Id = : classRecord.Id];
        System.assertEquals(4, outputClassDataOnUndelete.MyCount__c);
    }
}
