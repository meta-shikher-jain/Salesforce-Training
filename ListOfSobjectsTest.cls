@IsTest
public class ListOfSobjectsTest {
    @IsTest static void showAllSobjectsTest(){
        // Given
        List<String> ourTestObjects = new List<String>{'Account','Contact'};
        // When
        List<String> sobjectNameList = ListOfObjects.getsobjects(); 
        // Then
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