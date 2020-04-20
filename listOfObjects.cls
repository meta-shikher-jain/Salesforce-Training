ppublic class ListOfObjects {
   public static map<string, SObjectType> getSObjects()
   {
       map<string, SObjectType> objs = schema.getGlobalDescribe();
       return objs;
   }
}
