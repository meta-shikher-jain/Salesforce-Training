public class StudentInsertionClass {

    public static void NotAllowingInsertion(List<Student__c> studentsList){
        
       set<Id> classIds = new Set<ID>();
       for(Student__c student : studentsList) {
           classIds.add(student.class_object__c);
       }
        
       List<Class__c> classList = [select NoOfStudents__c, MaxSize__c from Class__c where Id IN :classIds];
       Map<Id,Class__c> classMap = new Map<Id,Class__c>();
        for(Class__c cls : classList){
            if(!classMap.containsKey(cls.Id))
                classMap.put(cls.Id,cls);
        }
        for(Student__c std : studentsList){
            if(classMap.get(std.class_object__c).NoOfStudents__c == classMap.get(std.class_object__c).MaxSize__c){        
                std.addError('Cannot insert Record - Class is full');
            }
        }
    }
}
