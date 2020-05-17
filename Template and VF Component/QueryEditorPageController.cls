public class QueryEditorPageController {
    public String query {get; set;}
    public Boolean checkQuery {get; set;}
    
    public QueryEditorPageController() {
        checkQuery = False;
    }
    public void executeQuery() {
        checkQuery = True;
    }
}