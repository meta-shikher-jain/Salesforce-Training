@IsTest
public class StudentTriggerTest {
    @IsTest 
    static void testStudentNotAllowedIfLimitExceed_FourStudentInserted_ExceptionThrown(){
        // Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 3);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, 
                                                    Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        //When
        try{
            insert studentList;
            System.assert(true,'A error Found');
            
        }
        //Then
        catch(DmlException ex){
            System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION,ex.getDmlType(0));
            System.assertEquals('Cannot add student in class, class size is full.', ex.getDmlMessage(0));
        }
    }

    @IsTest 
    static void testStudentAllowedIfLimitNOTExceed_FourStudentsInserted_FourStudents(){
        //Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 5);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, 
                                                    Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        //When
        insert studentList;
        //Then
        System.assertEquals(4, [SELECT Count() From Student__c WHERE Class_object__c = : classRecord.Id]);
    }

   
    @IsTest 
    static void testupdateMyCountOnClassOnStudentInsertion_FourStudentsInsertion_MyCountIsFour(){
        //Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i <4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, 
                                                    Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        //When
        insert studentList;
        Class__c outputClassDataOnInsert = [SELECT MyCount__c From Class__c WHERE Id = : classRecord.Id];
        //Then
        System.assertEquals(4, outputClassDataOnInsert.MyCount__c);
    }
   
    @IsTest 
    static void testupdateMyCountOnClassOnStudentDeletion_FourStudentsInserted_MyCountIsThree(){
        //Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 5);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, 
                                                    Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        //When
        insert studentList;
        delete studentList[0];
        //Then
        Class__c outputClassDataOnDelete = [SELECT MyCount__c From Class__c WHERE Id = : classRecord.Id];
        System.assertEquals(3, outputClassDataOnDelete.MyCount__c);
    }
    
    @IsTest 
    static void UndeletetestupdateMyCountOnClassOnStudentAddition_SixStudentsInserted_MyCountIsSix(){
       //Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10, MyCount__c = 1);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 6; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, 
                                                    Sex__c = 'Female',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        //When
        insert studentList;
        delete studentList[0];
        undelete studentList[0];
        Class__c outputClassDataOnUndelete = [SELECT MyCount__c From Class__c WHERE Id = : classRecord.Id];
        //Then
        System.assertEquals(6, outputClassDataOnUndelete.MyCount__c);
    }
}
