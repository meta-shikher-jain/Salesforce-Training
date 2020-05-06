@isTest
public class NoOFWorkingDaysTest {

     @IsTest 
     public static void testDaysWithoutWeekends(){  
         Test.startTest();
         Date startDate = Date.newInstance(2020, 04, 20);
         Date endDate = Date.newInstance(2020, 04, 25);
         Integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate, endDate);
         System.assertEquals(4,noOfWorkingDays);
         Test.stopTest();
       }
    
    @IsTest public static void testDaysWithWeekends(){
        Test.startTest();
        Date startDate = Date.newInstance(2020, 04, 17);
     	Date endDate = Date.newInstance(2020, 04, 24);
     	Integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate, endDate);
    	System.assertEquals(4,noOfWorkingDays);
    	Test.stopTest();
    }
    
    @IsTest public static void testSameDate(){
        Test.startTest();
        Date startDate = Date.newInstance(2020, 04, 17);
     	Date endDate = Date.newInstance(2020, 04,17);
     	Integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate, endDate);
    	System.assertEquals(0,noOfWorkingDays);
    	Test.stopTest();
    }       
}
