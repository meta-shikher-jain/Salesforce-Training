@IsTest
public class NoOFWorkingDaysTest {

    @IsTest public static void testDaysWithoutWeekends(){  
     Test.StartTest();
     Date startDate = Date.newInstance(2020, 04, 20);
     Date endDate = Date.newInstance(2020, 04, 25);
     Integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
     System.assertEquals(4,noOfWorkingDays);
     Test.StopTest();
    }
    
    @IsTest public static void testDaysWithWeekends(){
        Test.StartTest();
        Date startDate = Date.newInstance(2020, 04, 17);
        Date endDate = Date.newInstance(2020, 04, 24);
        Integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
        System.assertEquals(4,noOfWorkingDays);
        Test.StopTest();
    }
    
    @IsTest public static void testWithSameStartAndEndDate(){
        Test.StartTest();
        Date startDate = Date.newInstance(2020, 04, 17);
        Date endDate = Date.newInstance(2020, 04,17);
        Integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
        System.assertEquals(0,noOfWorkingDays);
        Test.StopTest();
    } 
    
    @IsTest public static void testWithNullStartAndEndDate(){
        Test.StartTest();
        Date startDate = null;
        Date endDate = Date.newInstance(2020, 04,17);
        try{
            Integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
    	
        }catch(Exception e){
            System.assertEquals(e.getMessage(),'Attempt to de-reference a null object');
        }
    	Test.StopTest();
    } 
}
