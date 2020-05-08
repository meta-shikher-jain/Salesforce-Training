@IsTest
public class ListOfSobjectsTest {
    @IsTest static void testStandardObjectsInOrg_AccountAndContact_Yes(){
        List<String> ourTestObjects = new List<String>{'Account','Contact'};
        List<String> sobjectNameList = sObjectListInOrg.getsObjectListInOrg(); 
        for(String expectedSobject : ourTestObjects){
			System.assert(sobjectNameList.Contains(expectedSobject), expectedSobject + 'object not found in org');
		}
    }
    
    @IsTest static void testCustomObjectsInOrg_ClassAndStudent_Yes(){
        List<String> ourTestObjects = new List<String>{'Class__c','Student__c'};
        List<String> sobjectNameList = sObjectListInOrg.getsObjectListInOrg(); 
        for(String expectedSobject : ourTestObjects){
            System.assert(sobjectNameList.Contains(expectedSobject), expectedSobject + 'object not found in org');
        }
    }
}
