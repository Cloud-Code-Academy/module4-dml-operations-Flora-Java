// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

 String accountName = 'Test Account';
    
List<String> oppNames = new List<String>{ 'Opp 1', 'Opp 2', 'Opp 3' };

        Account acct = new Account(Name = accountName);
    
        upsert as user acct;
    System.debug('acct first upsert: ', acct);
        Account newAccount = [SELECT Id FROM Account WHERE Name = :accountName WITH SECURITY_ENFORCED Limit 1];
        Id acctId = newAccount.Id;
    System.debug('acctId: ', acctId)
// Loop through each Opportunity name-Create an Opportunity with the given name-Add the Opportunity to the list
        List<Opportunity> listOppt = new List<Opportunity>();
        for (String opptyName : oppNames) {
            listOppt.add(new Opportunity(
                Name = opptyName,
                AccountId = acctId,
                CloseDate = Date.today().addMonths(1), 
                StageName = 'Prospecting')
            );
        }
        Integer numOppt = listOppt.size();
        upsert as user listOppt;
System.debug('opps: ' + contactsToUpsert);