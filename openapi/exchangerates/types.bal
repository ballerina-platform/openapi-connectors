public type InlineResponse200 record {
    # The currency code you supplied as base in your request
    string base?;
    # The date these exchange rates are for
    string date?;
    # Each supported currency code in terms of the base currency
    record {} rates?;
    # The epoch time this set of exchange rates was generated
    int time_last_updated?;
};

public type InlineResponse404 record {
    string error_type?;
    string result?;
};
