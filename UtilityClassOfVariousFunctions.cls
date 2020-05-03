public class UtilityClassOfVariousFunctions {

    public static List<String> getStudentNameListByClassId(Id classId){
        
        List<Student__c> all_students = [ SELECT First_Name__c FROM Student__c WHERE Class_object__c =: classId ];
        List<String> NameOfStudents = new List<String>();
        for(Student__c student : all_students){
            NameofStudents.add(student.First_Name__c);
        }
        return NameofStudents;
    }
    
    
    
    public static Map<Class__c,Set<Id>> StudentIdWithNames(){
       
           List<Class__c> classData= [SELECT Name,(SELECT Id from Students__r) FROM Class__c];
           Map<Class__c, Set<Id>> students = new Map<Class__c, Set<Id>>();
           List<Student__c> stdIds = [SELECT Id,Class_object__r.Id FROM Student__c];
           for(Class__c cls: classData)
           {
                  Set<Id> sIds = new Set<Id>();
                  for(Student__c student: stdIds)
                  {
                      if(student.Class_object__r.Id == cls.Id)
                      {
                  		sIds.add(student.Id);
              		}
          }
          students.put(cls, sIds);
      }
    	return students;
  }
       
    
    public static Integer NoOfWorkingDates(Date StartDate,Date EndDate){
       Integer workingDays=0;
       Integer totalDaysBetweenDates = StartDate.daysBetween(EndDate)-1;
       Integer noOfWeeks = totalDaysBetweenDates/7;
       
        If(Math.mod(totalDaysBetweenDates,7)==0){
            workingDays=noOfWeeks*5;
        }
        
        else{
              workingDays=noOfWeeks*5;
	      Integer remainingDays = Math.mod(totalDaysBetweenDates,7);
              for(Integer itr=1; itr<=remainingDays; itr++){
              Date todayDate = StartDate + itr;
              DateTime currD =DateTime.newInstance(todayDate.year(), todayDate.month(),todayDate.day());
              String TodayDay = currD.format('EEEE');
              if(TodayDay !='Saturday' && TodayDay != 'Sunday'){
                  workingDays++;
              }
          }
        }
        return workingDays;
    }
}

