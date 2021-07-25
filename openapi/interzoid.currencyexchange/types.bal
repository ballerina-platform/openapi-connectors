# Contains details about exchange rate of the currency
public type ExchangeRate record {
    # Status of the response
    string Code?;
    # Country where this currency is in use
    string Country?;
    # Credits remaining for usage of API
    string Credits?;
    # Name of currency
    string Name?;
    # Current rate equal to one US dollar
    string Rate?;
    # Symbol of currency
    string Symbol?;
};
