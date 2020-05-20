public class QueryEditorController {
    public List<String> objectFields {get; set;}
    public Integer resultSize {get; set;}
    public String dbQuery {get; set;}
    public List<String> ListOfFields {get; set;}
    public Integer numberOfColumns {get; set;}
    public String sortDirection = 'ASC';
    public String sortExpBy {get; set;}
    public Boolean checkSort {get;set;}
    public Integer size;
    
    /*Construction for initillization
*/
    public QueryEditorController() {
        con = Null;
        checkSort = False;
        resultSize = 0;
        size = 10;
    }
    
    public ApexPages.StandardSetController con {
        get{
            if (con == null) {
                try {
                	con = new ApexPages.StandardSetController(Database.query(dbQuery));
                    ListOfFields = new List<String>();
                    String fieldsName = dbQuery.trim().substring(6,dbQuery.toLowerCase().trim().lastIndexOf('from'));
                    String[] field = fieldsName.split(',');
                    for(Integer i=0; i<field.size(); i++){
                        ListOfFields.add(field[i].trim());    
                     }
                	numberOfColumns = ListOfFields.size();
                } catch(Exception e) {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
                }
                con.setpagesize(size);
            }
            return con;
        }
        set;
    }
    
    public void sortData() {
        checkSort = true;
        con = null;
   }
    
    public List<sObject> getListOfSobject() {

        if (checkSort) {
            sortDirection = (sortDirection == 'ASC') ? 'DESC' : 'ASC';
        	string sortFullExp = sortExpBy  + ' ' + sortDirection;
        	dbQuery += ' order by ' + sortFullExp;
        }
        resultSize = con.getResultSize();
        return con.getRecords();
    }
}
