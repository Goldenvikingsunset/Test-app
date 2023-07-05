/// <summary>
/// Table Customer Category_REN (ID 50100).
/// </summary>
table 50100 "Customer Category_REN"
{
    DrillDownPageId = "Customer Category List_REN";
    LookupPageId = "Customer Category List_REN";
    Caption = 'Customer Category';

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(3; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';
        }
        field(4; EnableNewsletter; Enum NewsletterType)
        {
            Caption = 'Enable Newsletter';
            DataClassification = CustomerContent;
        }
        field(5; FreeGiftsAvailable; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gifts Available';
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Blocked';
        }
        field(10; TotalCustomersForCategory; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Customer where("Customer Category Code_REN" = field(Code)));
            Caption = 'No. of associated customers';
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
        key(K2; Description)
        {
            Unique = true;
        }
    }

    /// <summary>
    /// GetSalesAmount.
    /// </summary>
    /// <returns>Return value of type Decimal.</returns>
    procedure GetSalesAmount(): Decimal
    var
        CustomerCategoryMgt: Codeunit "Customer Category Mgt_REN";
    begin
        exit(CustomerCategoryMgt.GetSalesAmount(Rec.Code));
    end;
}