@Istest
public class TestFactoryDataForAccountAndContact {
    // Method to create the contatcs corresponding to accounts 
    public static List<Contact> createAccountsWithContacts(Integer numAccts, Integer numOppsPerAcct){
        List<Account> accts = new List<Account>();
        for(Integer i = 0; i < numAccts; i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        List<Contact> contList = new List<Contact>();
        for (Integer j = 0; j < numAccts; j++) {
            Account acct = accts[j];
            // For each account just inserted, add contact
            for (Integer k = 0; k < numOppsPerAcct; k++) {
                contList.add(new Contact(FirstName = acct.Name + ' firstname Contact ' + k,
                                     LastName = acct.Name + ' lastname Contact ' + k,
                                       AccountId=acct.Id));
            }
        }
        // Insert all contacts for all accounts.
        insert contList;
        return contList;
    }
}