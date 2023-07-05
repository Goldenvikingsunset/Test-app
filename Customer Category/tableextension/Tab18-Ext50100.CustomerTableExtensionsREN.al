/// <summary>
/// TableExtension CustomerTableExtensions_REN (ID 50100) extends Record Customer //18.
/// </summary>
tableextension 50100 "CustomerTableExtensions_REN" extends Customer //18 
{
    fields
    {
        field(50100; "Customer Category Code_REN"; Code[20])
        {
            TableRelation = "Customer Category_REN".Code;
            Caption = 'Customer Category Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                CustomerCategory: Record "Customer Category_REN";
                ErrBlocked: Label 'This category is Blocked.';
            begin
                CustomerCategory.Get("Customer Category Code_REN");
                if CustomerCategory.Blocked then
                    Error(ErrBlocked);
            end;
        }
    }

    keys
    {
        key(CustomerCategory; "Customer Category Code_REN")
        {
        }
    }
}