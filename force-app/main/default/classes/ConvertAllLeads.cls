global class ConvertAllLeads implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator([SELECT Id FROM Lead WHERE IsConverted = FALSE]);
    }
    global void execute(Database.BatchableContext context, Lead[] scope) {
        Database.LeadConvert[] converts = new Database.LeadConvert[0];
        String convertedStatus = [SELECT MasterLabel FROM LeadStatus WHERE IsConverted = TRUE LIMIT 1].MasterLabel;
        for(Lead record: scope) {
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(record.Id);
            lc.setConvertedStatus(convertedStatus);
            lc.setDoNotCreateOpportunity(true);
            converts.add(lc);
        }
        Database.convertLead(converts, false);
    }
    global void finish(Database.BatchableContext context) {

    }
}
