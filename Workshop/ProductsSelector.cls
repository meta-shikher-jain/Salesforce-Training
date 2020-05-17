public class ProductsSelector extends fflib_SObjectSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Product2.Description,
            Product2.Id,
            Product2.IsActive,
            Product2.Name,
            Product2.ProductCode,
            Product2.Quantity_Available__c};
    }
    public Schema.SObjectType getSObjectType() {
        return Product2.sObjectType;
    }
    
    public List<SObject> selectById(Set<ID> idSet) {
        return (List<SObject>) selectSObjectsById(idSet);
    }
    
    public List<Product2> selectAllProduct() {
        fflib_QueryFactory query = newQueryFactory();
        fflib_QueryFactory lineItemsQueryFactory = new PricebookEntriesSelector().addQueryFactorySubselect(query);        
        return (List<SObject>) Database.query( query.toSOQL() );
    }
    
    public Integer getNoOfProductRecords(){
        String query = 'SELECT COUNT() FROM' +' '+ getSObjectName();
        Integer NoOfProductRecords = Database.countQuery(query);
   	 	return NoOfProductRecords;
    }
}
