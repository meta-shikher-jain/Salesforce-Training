public class StudentTriggerHelper {
    public static void StudentNotAllowedIfLimitExceed(List<Student__c> studentList){
        Set<Id> classIds = new Set<Id>();
        for(Student__c studentRecord : studentList){
            classIds.add(studentRecord.Class__c);
        }
        List<Class__c> classList = [SELECT MyCount__c,MaxSize__c,(SELECT Id FROM Students__r) FROM Class__c WHERE Id IN : classIdInStudentListSet];
        Map<Id,Integer> classIdToStudentCountMap = new Map<Id,Integer>();
        Map<Id,Integer> classIdToMaxStudentSizeMap = new Map<Id,Integer>();
        for(Class__c classRecord : classList){
            classIdToStudentCountMap.put(classRecord.Id, classRecord.Students__r.size());
            classIdToMaxStudentSizeMap.put(classRecord.Id,(Integer)classRecord.MaxSize__c);
        }

        for(Student__c stud : studentList){
            if(classIdToStudentCountMap.get(stud.Class__c) >= classIdToMaxStudentSizeMap.get(stud.Class__c)){
                stud.addError('Cannot add student in class, class size is full.');    
            } else	{
                classIdToStudentCountMap.put(stud.Class__c,classIdToStudentCountMap.get(stud.Class__c) + 1);
            }
        }
    }
        public static void updateMyCountOnClassOnStudentAddition(List<Student__c> studentList){
        Set<Id> studClassId = new Set<Id>();
        for(Student__c stud : studentList){
            studClassId.add(stud.Class__c);
        }
        List<Class__c> classDataList = [SELECT MyCount__c,(SELECT Id FROM Students__r) FROM Class__c WHERE Id IN : studClassId];
        for(Class__c classRecord : classDataList){
            classRecord.MyCount__c = classRecord.Students__r.size();
        }
        update classDataList;
    }
}
