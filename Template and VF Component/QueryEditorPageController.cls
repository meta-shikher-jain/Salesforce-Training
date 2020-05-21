public class QueryEditorPageController {
    public String query {get; set;}
    public Boolean checkQuery {get; set;}
    
    public QueryEditorPageController() {
        checkQuery = false;
    }
    public void executeQuery() {
        checkQuery = true;
    }
}
