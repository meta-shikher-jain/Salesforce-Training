public class ManageClassController {
    public Id ClassId {get; set;}
    public Class__c SelectedClass{get; set;}
    public boolean render{get; set;}
    
    public ManageClassController(){
        render = false;
    }
    
    public List<Class__c> getClasses(){
        return [SELECT Name,Board__c,ClassTeacher__r.Name,MaxSize__c,NoOfStudents__c,MyCount__c FROM class__c];
    }
    
    public void EditClass(){
        SelectedClass = [SELECT Name,Board__c,ClassTeacher__r.Name,MaxSize__c,NoOfStudents__c,MyCount__c FROM class__c WHERE Id =: ClassId];
        render = true;
    }
    
    public void DeleteClass(){
        SelectedClass = [SELECT Name,Board__c,ClassTeacher__r.Name,MaxSize__c,NoOfStudents__c,MyCount__c FROM class__c WHERE Id =: ClassId];
	render = false;
        delete SelectedClass;
    }
    
    public void UpdateClass(){
        update SelectedClass;
        render = false;
    }
    
}
