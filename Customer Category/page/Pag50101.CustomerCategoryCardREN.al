/// <summary>
/// Page CustomerCategoryCard_REN (ID 50101).
/// </summary>
page 50101 "CustomerCategoryCard_REN"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Customer Category_REN";
    Caption = 'Customer Category Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; xrec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; xrec.Description)
                {
                    ApplicationArea = All;
                }
                field(Default; xrec.Default)
                {
                    ApplicationArea = All;
                }
                field(EnableNewsletter; xrec.EnableNewsletter)
                {
                    ApplicationArea = All;
                }
                field(FreeGiftsAvailable; xrec.FreeGiftsAvailable)
                {
                    ApplicationArea = All;
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field(Blocked; xrec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
            group(Statistics)
            {
                Caption = 'Statistics';
                field(TotalCustomersForCategory; xrec.TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(TotalSalesAmount; TotalSalesAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Sales Order Amount';
                    Editable = false;
                    Style = Strong;
                }
            }
        }
    }
    var
        TotalSalesAmount: Decimal;

    trigger OnAfterGetRecord()
    begin
        TotalSalesAmount := Rec.GetSalesAmount();
    end;
}