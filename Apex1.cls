public class ApexAssignment1 {

    public static List<String> NameOfStudents(Id classId){
        
        List<Student__c> all_students = [ SELECT First_Name__c From Student__c WHERE Class_object__c =: classId ];
        
        List<String> NameOfStudents = new List<String>();
        
        for(Student__c student : all_students){
            NameofStudents.add(student.First_Name__c);
        }
     
        return NameofStudents;
        
    }
    
    
    
    public static Map<String,Set<Id>> StudentInClass(){
        
        List<Class__c> classData= [SELECT Name,(SELECT Id from Students__r) from Class__c];
        
        Map<String,Set<Id>> students = new Map<String,Set<Id>>();
        
        for(Class__c temp: classData){
            
            Set<Id> StudentId = new Set<Id>();
            for(Student__c student : temp.Students__r){
                StudentId.add(student.Id);
            }
            students.put(temp.Name,StudentId);
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

