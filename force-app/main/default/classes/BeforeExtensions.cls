public class BeforeExtensions {

    ApexPages.StandardController cont;

    public BeforeExtensions(ApexPages.StandardController cont) {
        this.cont = cont;
        cont.addFields(getSuggestedFields());
        cont.addFields(getFrequentFields());

    }

    public PageReference getAccountEditPage() {
        Id acctId = ((Order) cont.getRecord()).AccountId;
        return new PageReference('/' + acctId + '/e');
    }

    public List<String> getSuggestedFields() {
        return new List<String> { 'PoNumber',
            'TotalAmount', 'AccountId', 'BillToContactId'
        };
    }

    public List<String> getFrequentFields() {
        return new List<String> { 'Status', 'EffectiveDate', 'StatusCode', 'ContractId'
        };
    }

    public String getType() {
        return 'DefaultType';
    }

}