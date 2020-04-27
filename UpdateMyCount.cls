trigger UpdateMyCount on Student__c (before insert,before update) {

    set<Id> classIds = new set<Id>();
    for(Student__c student: trigger.new){
        classIds.add(student.class_object__c);
    }
        
       List<Class__c> classList = [select NoOfStudents__c, MyCount__c,MaxSize__c from Class__c where Id IN :classIds];
        
       Map<Id,Class__c> classMap = new Map<Id,Class__c>();
       
        for(Class__c cls : classList){
            if(!classMap.containsKey(cls.Id))
                classMap.put(cls.Id,cls);
        }
        for(Student__c std : trigger.new){
            System.debug('My count '+classMap.get(std.class_object__c).MyCount__c);
            system.debug('max size' +classMap.get(std.class_object__c).MaxSize__c);
            if(classMap.get(std.class_object__c).MyCount__c < classMap.get(std.class_object__c).MaxSize__c){
                 classMap.get(std.Class_object__c).MyCount__c++;
            }
            else{
                std.addError('Cannot insert Record - fjs is full');
            }
            
            update classMap.values();
                
        }