@isTest
    public class NotInsertTeacherTest {
    
        @Istest static void NotInsertTeacherHavingSubjectHindi(){
            Class__c testClass = new Class__c(Name = 'Hindi', MaxSize__c = 20);
            insert testClass;
            Contact testContact = new Contact(LastName = 'jain');
            insert testContact;
            Teach__c teacher = new Teach__c(Name = 'Shikher',Subjects__c = 'English',
                                            Teacher__c = testContact.id ,Class__c = testClass.id );
    
            test.starttest();
            
            try{
	               
            		insert teacher;
            		
            }
            catch(Exception e){
                String expectedExceptionThrown =  e.getMessage();
                system.assertEquals('You cant add teacher with subject teaching hindi', expectedExceptionThrown);


            }
           
        }
    }