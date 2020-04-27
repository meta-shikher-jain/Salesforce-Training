trigger NotInsertTeacherTrigger on Teach__c (before insert) {
	
    Set<id> idOfTeacher = new Set<id>();
    for(Teach__c teacher : trigger.new ){
        if(teacher.Subjects__c == 'Hindi')
			teacher.addError('You cant add teacher with subject teaching hindi');
       }
}