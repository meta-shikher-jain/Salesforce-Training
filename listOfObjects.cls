ppublic class ListOfObjects {
  public static void getsobjects()
   {
      List<String> stdObjectNames = new List<String>();
      for (Schema.SObjectType typ : Schema.getGlobalDescribe().values())
       {
         String sobjName = String.valueOf(typ);
           if (!sobjName.contains('__c') )
           {
               stdObjectNames.add(sobjName);
           }
      }
   }
}
