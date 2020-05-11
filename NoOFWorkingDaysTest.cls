@isTest
public class NoOFWorkingDaysTest {

    @IsTest 
    public static void testDays_TwoDatesWithoutWeekends_FourDays(){  
     Test.startTest();
     //Given
     Date startDate = Date.newInstance(2020, 04, 20);
     Date endDate = Date.newInstance(2020, 04, 25);
     //When
     integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
   	 //Then
     System.assertEquals(4,noOfWorkingDays);
     Test.stopTest();
    }
    
    @IsTest 
    public static void testDaysTwoDatesWithWeekends_FourDays(){
        Test.startTest();
        //Given
        Date startDate = Date.newInstance(2020, 04, 17);
     	Date endDate = Date.newInstance(2020, 04, 24);
        //When
     	integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
        //Then
    	System.assertEquals(4,noOfWorkingDays);
    	Test.stopTest();
    }
    
    @IsTest 
    public static void testWith_SameStartAndEndDate_ZeroDays(){
        Test.startTest();
        //Given
        Date startDate = Date.newInstance(2020, 04, 17);
     	Date endDate = Date.newInstance(2020, 04,17);
        //When
     	integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
        //Then
    	System.assertEquals(0,noOfWorkingDays);
    	Test.stopTest();
    } 
    
    @IsTest 
    public static void testWith_NullStartAndEndDate_ExceptionOccurs(){
        Test.startTest();
        //Given
        Date startDate = null;
     	Date endDate = Date.newInstance(2020, 04,17);
        //When
        try{
            integer noOfWorkingDays = Utility.NoOfWorkingDates(startDate,endDate);
    	
        }catch(Exception e){
            //Then
            System.assertEquals(e.getMessage(),'Attempt to de-reference a null object');
        }
    	Test.stopTest();
    } 
}
