public class AccountSearchControllers {
    public String BillingCity{get; set;}
    public String BillingState{get; set;}
    public String BillingCountry{get; set;}
    public Integer numOfRecords{get; set;}
    public Integer ResultSize{get; set;}
    public boolean isResultDisplay{get; set;}
    String strSOQL;
    
    public AccountSearchControllers(){
        isResultDisplay = false;
        numOfRecords = 10;
    }
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.query(strSOQL));
                setCon.setpagesize(numOfRecords);
            }
            return setCon;
        }
        set;
    }
    public void SearchAccountRec(){
        setCon = null;
    }
    public List<Account> getAccounts(){
        isResultDisplay = true;
        strSOQL = 'SELECT id,Name,BillingCity,BillingState,BillingCountry FROM Account';
        if(!String.IsBlank(BillingCity) || !String.IsBlank(BillingState) || !String.IsBlank(BillingCountry)){
            strSOQL += ' WHERE';
            strSOQL += String.IsBlank(BillingCity) ? '' : ' BillingCity LIKE \'%'+BillingCity+'%\'' + ' AND';
            strSOQL += String.IsBlank(BillingState) ? '' : ' BillingState LIKE \'%'+BillingState+'%\'' + ' AND';
            strSOQL += String.IsBlank(BillingCountry) ? '' : ' BillingCountry LIKE \'%'+BillingCountry+'%\'';
        }
        if(strSOQL.endsWith('AND')) {
            strSOQL = strSOQL.removeEnd('AND');
        }
        ResultSize = setCon.getResultSize();
       	return (List<Account>) setCon.getRecords();
    }
}