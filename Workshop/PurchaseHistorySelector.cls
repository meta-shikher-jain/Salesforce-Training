public class PurchaseHistorySelector extends fflib_SObjectSelector {
    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{
            Purchase__c.Id,
            Purchase__c.Price__c,
            Purchase__c.Order_Status__c};
    }
    
    public Schema.SObjectType getSObjectType() {
        return Purchase__c.sObjectType;
    } 
    
    public List<Purchase__c> selectById(Set<ID> idSet) {
        return (List<Purchase__c>) selectSObjectsById(idSet);
    }
    
    public  List<Purchase__c> selectAllProduct(){
        fflib_QueryFactory query = newQueryFactory();
	return (List<Purchase__c>) Database.query( query.toSOQL() );
    }
	
    public Integer getNoOfHistoryRecords(){
        String query = 'SELECT COUNT() FROM' +' '+ getSObjectName();
        Integer NoOfHistoryRecords = Database.countQuery(query);
   	return NoOfHistoryRecords;
    }
}
