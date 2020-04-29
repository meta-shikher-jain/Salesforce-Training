trigger updateMyCount on Student__c (before insert,before update) {

    	Set<Id> studClassId = new Set<Id>();
        for(Student__c stud : trigger.new){
            studClassId.add(stud.Class_object__c);
        }
        List<Class__c> classDataList = [SELECT MyCount__c,(SELECT Id FROM Students__r) FROM Class__c WHERE Id IN : studClassId];
        for(Class__c classRecord : classDataList){
            classRecord.MyCount__c = classRecord.Students__r.size();
        }
        update classDataList;
}
