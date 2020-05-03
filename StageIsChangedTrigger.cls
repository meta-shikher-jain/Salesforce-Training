trigger StageIsChangedTrigger on Opportunity (before update) {
    if(Trigger.IsBefore && Trigger.IsUpdate){
        StageIsChanged.updateCloseDateFieldWithToday(Trigger.newMap,Trigger.oldMap);
    }
}
