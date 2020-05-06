public class ManageClassController {
    public Id ClassId {get;set;}
    public Class__c SelectedClass{get;set;}
    public boolean render{set;get;}
    
    public ManageClassController(){
        render = false;
    }
    
    public List<Class__c> getClasses(){
        return [Select Name,Board__c,ClassTeacher__r.Name,MaxSize__c,NoOfStudents__c,MyCount__c from class__c];
    }
    
    public void EditClass(){
        SelectedClass = [Select Name,Board__c,ClassTeacher__r.Name,MaxSize__c,NoOfStudents__c,MyCount__c from class__c where id =: ClassId];
        render = true;
    }
    
    public void DeleteClass(){
        SelectedClass = [Select Name,Board__c,ClassTeacher__r.Name,MaxSize__c,NoOfStudents__c,MyCount__c from class__c where id =: ClassId];
		render = false;
        delete SelectedClass;
    }
    
    public void UpdateClass(){
        update SelectedClass;
        render = false;
    }
    
}