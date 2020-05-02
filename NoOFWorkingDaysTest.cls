@isTest
public class NoOFWorkingDaysTest {

    @IsTest public static void DaysWithoutWeekends(){
        
     test.startTest();
     Date startDate = Date.newInstance(2020, 04, 20);
     Date endDate = Date.newInstance(2020, 04, 25);
     integer noOfWorkingDays = UtilityClassOfVariousFunctions.NoOfWorkingDates(startDate,endDate);
     System.assertEquals(4,noOfWorkingDays);
     test.stopTest();
    }
    
    @IsTest public static void DaysWithWeekends(){
        test.startTest();
        Date startDate = Date.newInstance(2020, 04, 17);
     	Date endDate = Date.newInstance(2020, 04, 24);
     	integer noOfWorkingDays = UtilityClassOfVariousFunctions.NoOfWorkingDates(startDate,endDate);
    	System.assertEquals(4,noOfWorkingDays);
    	test.stopTest();
    }
    
    @IsTest public static void SameDate(){
        test.startTest();
        Date startDate = Date.newInstance(2020, 04, 17);
     	Date endDate = Date.newInstance(2020, 04,17);
     	integer noOfWorkingDays = UtilityClassOfVariousFunctions.NoOfWorkingDates(startDate,endDate);
    	System.assertEquals(0,noOfWorkingDays);
    	test.stopTest();
    }
       
}
