/// <summary>
/// Table REN Extension Setup (ID 50103).
/// </summary>
table 50103 "REN Extension Setup"
{
    DataClassification = CustomerContent;
    Caption = 'REN Extension Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Minimum Accepted Vendor Rate"; Decimal)
        {
            Caption = 'Minimum Accepted Vendor Rate for Purchases';
            DataClassification = CustomerContent;
        }
        field(3; "Gift Tolerance Qty"; Decimal)
        {
            Caption = 'Gift Tolerance Quantity for Sales';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}