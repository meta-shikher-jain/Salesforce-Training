public class ListOfObjects {

    public static List<String> AllObjectsList(){
        
        List<String> sObjectList = new List<String>();
        
        for(Schema.SObjectType obj :Schema.getGlobalDescribe().Values()){
            String name=obj.getDescribe.getName();
            sObjectlist.add(name);
        }
        
        for(String s:sObjectList){
            System.debug(s);
        }
        
        return sObjectList;
    }
}