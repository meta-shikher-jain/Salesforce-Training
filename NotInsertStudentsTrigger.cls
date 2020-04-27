trigger NotInsertStudentsTrigger on Student__c(before insert) {
	
    StudentInsertionClass.NotAllowingInsertion(trigger.new);
}