public with sharing class CaseService {
    
   
    public static void populateFieldsFromOpportunity(List<Case> records) {
        Set<id> opptyList= new Set<id>();
        for(Case eachCase:records){
           
        }
         
        Map<id,Opportunity> opportunityMap= new Map<Id,Opportunity>([Select id,AccountId From Opportunity where id in :opptyList]);
         
        if(!opportunityMap.isEmpty()){
            for(Case c:records){
              
            }
        }
    }
    }