@isTest
public class NoOFWorkingDaysTest {

    @IsTest public static void testDaysWithoutWeekends(){  
     test.startTest();
     Date startDate = Date.newInstance(2020, 04, 20);
     Date endDate = Date.newInstance(2020, 04, 25);
     integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
     System.assertEquals(4,noOfWorkingDays);
     test.stopTest();
    }
    
    @IsTest public static void testDaysWithWeekends(){
        test.startTest();
        Date startDate = Date.newInstance(2020, 04, 17);
     	Date endDate = Date.newInstance(2020, 04, 24);
     	integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
    	System.assertEquals(4,noOfWorkingDays);
    	test.stopTest();
    }
    
    @IsTest public static void testSameDate(){
        test.startTest();
        Date startDate = Date.newInstance(2020, 04, 17);
     	Date endDate = Date.newInstance(2020, 04,17);
     	integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
    	System.assertEquals(0,noOfWorkingDays);
    	test.stopTest();
    }       
}
