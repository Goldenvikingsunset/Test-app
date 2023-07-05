/// <summary>
/// Page Customer Category List_REN (ID 50100).
/// </summary>
page 50100 "Customer Category List_REN"
{
    PageType = List;
    SourceTable = "Customer Category_REN";
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = CustomerCategoryCard_REN;
    Caption = 'Customer Category List';
    AdditionalSearchTerms = 'ranking, categorization';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field(TotalCustomersForCategory; xrec.TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Total Customers for Category';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Create Default Category")
            {
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Create default category';
                Caption = 'Create default category';

                trigger OnAction();
                var
                    CustManagement: Codeunit "Customer Category Mgt_REN";
                begin
                    CustManagement.CreateDefaultCategory();
                end;
            }
        }
    }
}