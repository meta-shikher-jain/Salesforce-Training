public class sObjectListInOrg {
  public static List<String> getsObjectListInOrg()
   {
      List<String> stdObjectNames = new List<String>();
      for (Schema.SObjectType typ : Schema.getGlobalDescribe().values())
       {
         String sobjName = String.valueOf(typ);
         stdObjectNames.add(sobjName);
      }
    return stdObjectNames;
   }
}
