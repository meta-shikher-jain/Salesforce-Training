@IsTest
public class QueryEditorControllerTest {

    @isTest
    static void TestNoOfFieldsInQuery(){
        //Given
        Class__c cls = new Class__c(Name = 'English');
        insert cls;
        Student__c student = new Student__c(Class_object__c = cls.id ,Name = 'Shikher',Sex__c = 'Male');
        insert student;
        //When
        String dbQuery = 'Select Id,Name,Class_object__c,Sex__c from Student__c';
        QueryEditorController custom = new QueryEditorController();
        Test.startTest();
        custom.dbQuery = dbQuery;
        custom.con = null ;
        List<Student__c> actual = custom.getListOfSobject();
        Test.stopTest();
        //Then
        System.assertEquals(4,custom.numberOfColumns);
    }
    
    @isTest
    static void TestQueryResultsSize(){
        List<Student__c> studentList = new List<Student__C>();
        //Given
        Class__c cls = new Class__c(Name = 'English');
        insert cls;
        for(Integer itr = 0;itr < 2;itr++){
        	Student__c student = new Student__c(Class_object__c = cls.id ,Name = 'Shikher '+ itr ,Sex__c = 'Male');
         	studentList.add(student);
        }
        insert studentList;
        //When
        String dbQuery = 'Select Id,Name,Class_object__c,Sex__c from Student__c';
        QueryEditorController custom = new QueryEditorController();
        Test.startTest();
        custom.dbQuery = dbQuery;
        custom.con = null ;
        List<Student__c> actual = custom.getListOfSobject();
        Test.stopTest();
        //Then
        System.assertEquals(2,actual.size());
    }
    
    @isTest
    static void TestresultQuery(){
        //Given
        Class__c cls = new Class__c(Name = 'English');
        insert cls;
        Student__c student = new Student__c(Class_object__c = cls.id ,Name = 'Shikher',Sex__c = 'Male');
        insert student;
        //When
        String dbQuery = 'Select Id,Name,Class_object__c,Sex__c from Student__c';
        QueryEditorController custom = new QueryEditorController();
        Test.startTest();
        custom.dbQuery = dbQuery;
        custom.con = null ;
        List<Student__c> actual = custom.getListOfSobject();
        system.debug(actual);
        Test.stopTest();
        //Then
        System.assertEquals('Shikher',actual[0].Name);
    }
    
}