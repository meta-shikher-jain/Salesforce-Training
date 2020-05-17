public class PricebookEntriesSelector extends fflib_SObjectSelector {
        public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            PricebookEntry.Product2Id,
            PricebookEntry.Id,
            PricebookEntry.unitprice
        };
    }
    public Schema.SObjectType getSObjectType() {
        return PricebookEntry.sObjectType;
    }
    
    public List<SObject> selectById(Set<ID> idSet) {
        return (List<SObject>) selectSObjectsById(idSet);
    }
    
    public List<PricebookEntry> selectAllPricebookEntry() {
        fflib_QueryFactory query = newQueryFactory();
        return (List<SObject>) Database.query( query.toSOQL() );
    }

}