@IsTest
public class ListOfSobjectsTest {
    @IsTest 
    static void testStandardObjectsInOrg_AccountAndContact_Yes(){
        List<String> ourTestObjects = new List<String>{'Account','Contact'};
        List<String> sobjectNameList = sObjectListInOrg.getsObjectListInOrg(); 
        for(String expectedSobject : ourTestObjects){
            if(sobjectNameList.Contains(expectedSobject)){
                System.assert(true,expectedSobject);
            }
            else{
                System.assert(false,expectedSobject);
            }
        }
    }
    
    @IsTest static void testCustomObjectsInOrg_ClassAndStudent_Yes(){
        List<String> ourTestObjects = new List<String>{'Class__c','Student__c'};
        List<String> sobjectNameList = sObjectListInOrg.getsObjectListInOrg(); 
        for(String expectedSobject : ourTestObjects){
            if(sobjectNameList.Contains(expectedSobject)){
                System.assert(true,expectedSobject);
            }
            else{
                System.assert(false,expectedSobject);
            }
        }
    }
}
