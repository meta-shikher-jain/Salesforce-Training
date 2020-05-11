@IsTest public class StatusIsChangedTest {

    @IsTest 
    static void testCustomStatusChangedFromNewToReset_NoOfStudentsIsZero(){
        //Given
        Class__c classRecord= new Class__c(MaxSize__c = 20, Name = 'Program',Custom_Status__c = 'New');
        insert classRecord;
      	List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Male',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;
        //When
        Test.StartTest();
        classRecord.Custom_Status__c = 'Reset';
        update classRecord;
        Test.StopTest();
        Integer NoOfStudents= [SELECT COUNT() FROM Student__c WHERE Class_object__c =:classRecord.id];
        //Then
        System.assertEquals(0,NoOfStudents);
    }
    
    
    @IsTest 
    static void testCustomStatusChangedFromNewToOpen_NoOfStudentsAreFour(){
        //Given
        Class__c classRecord = new Class__c(Board__c = 'Bihar',Fee__c = 1000, MaxSize__c = 10);
        insert classRecord;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 0; i < 4; i++){
            Student__c studentData = new Student__c(First_Name__c = 'Test Name '+ i, LastName__c = 'LastName' + i, Sex__c = 'Male',Class_object__c = classRecord.Id);
            studentList.add(studentData);
        }
        insert studentList;        
       	//When
        Test.StartTest();
        classRecord.Custom_Status__c = 'Open';
        update classRecord;
        Test.StopTest();
        Integer NoOfStudents= [SELECT COUNT() FROM Student__c WHERE Class_object__c =:classRecord.id];
        //Then
        System.assertEquals(4,NoOfStudents);
    }
}
