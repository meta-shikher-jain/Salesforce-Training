trigger StageIsChanged on Opportunity (before update) {
  
    for(Opportunity opt : trigger.new){
        if(opt.StageName == 'Closed Won' || opt.StageName =='Closed Lost'){
           opt.CloseDate = System.Today();
        }
    }
}