@IsTest
public class ListOfSobjectsTest {
    @IsTest 
    static void testStandardObjectsInOrg_AccountAndContact_Yes(){
        //Given
        List<String> ourTestObjects = new List<String>{'Account','Contact'};
        //When
        List<String> sobjectNameList = sObjectListInOrg.getsObjectListInOrg(); 
        for(String expectedSobject : ourTestObjects){
            //Then
		System.assert(sobjectNameList.Contains(expectedSobject), expectedSobject + 'object not found in org');
	}
    }
    
    @IsTest 
    static void testCustomObjectsInOrg_ClassAndStudent_Yes(){
        //Given
        List<String> ourTestObjects = new List<String>{'Class__c','Student__c'};
        //When
        List<String> sobjectNameList = sObjectListInOrg.getsObjectListInOrg(); 
        for(String expectedSobject : ourTestObjects){
            //Then
            System.assert(sobjectNameList.Contains(expectedSobject), expectedSobject + 'object not found in org');
        }
    }
}
