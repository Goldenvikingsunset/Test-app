/// <summary>
/// PageExtension CustomerListExtension_REN (ID 50103) extends Record Customer List.
/// </summary>
pageextension 50103 "CustomerListExtension_REN" extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action("Assign Default Category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Caption = 'Assign Default Category to all Customers';
                ToolTip = 'Assigns the Default Category to all Customers';

                trigger OnAction();
                var
                    CustomerCategoryMgt: Codeunit "Customer Category Mgt_REN";
                begin
                    CustomerCategoryMgt.AssignDefaultCategory();
                end;
            }
        }
    }

    views
    {
        addlast
        {
            view(CustomersWithoutCategory)
            {
                Caption = 'Customers without Category assigned';
                Filters = where("Customer Category Code_REN" = filter(''));
            }
        }
    }
}