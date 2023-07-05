/// <summary>
/// PageExtension CustomerCardExtension_REN (ID 50102) extends Record Customer Card.
/// </summary>
pageextension 50102 "CustomerCardExtension_REN" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Category Code_REN"; Rec."Customer Category Code_REN")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer Category Code field.';
            }
        }
    }

    actions
    {
        addlast("F&unctions")
        {
            action("Assign default category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Caption = 'Assign Default Category';
                ToolTip = 'Assigns Default Category to the current Customer';

                trigger OnAction();
                var
                    CustomerCategoryMgt: Codeunit "Customer Category Mgt_REN";
                begin
                    CustomerCategoryMgt.AssignDefaultCategory(Rec."No.");
                end;
            }
        }
    }
}