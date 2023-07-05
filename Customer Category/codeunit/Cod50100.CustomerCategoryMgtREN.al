/// <summary>
/// Codeunit Customer Category Mgt_REN (ID 50100).
/// </summary>
codeunit 50100 "Customer Category Mgt_REN"
{
    /// <summary>
    /// CreateDefaultCategory.
    /// </summary>
    procedure CreateDefaultCategory()
    var
        CustomerCategory: Record "Customer Category_REN";
    begin
        CustomerCategory.Code := 'DEFAULT';
        CustomerCategory.Description := 'Default Customer Category';
        CustomerCategory.Default := true;
        if CustomerCategory.Insert then;
    end;

    /// <summary>
    /// AssignDefaultCategory.
    /// </summary>
    /// <param name="CustomerCode">Code[20].</param>
    procedure AssignDefaultCategory(CustomerCode: Code[20])
    var
        Customer: Record Customer;
        CustomerCategory: Record "Customer Category_REN";
    begin
        //Set default category for a Customer 
        Customer.Get(CustomerCode);
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            Customer."Customer Category Code_REN" := CustomerCategory.Code;
            Customer.Modify();
        end;
    end;

    /// <summary>
    /// AssignDefaultCategory.
    /// </summary>
    procedure AssignDefaultCategory()
    var
        Customer: Record Customer;
        CustomerCategory: Record "Customer Category_REN";
    begin
        //Set default category for ALL Customer 
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            Customer.SetFilter("Customer Category Code_REN", '%1', '');
            Customer.ModifyAll("Customer Category Code_REN", CustomerCategory.Code, true);
        end;
    end;

    //Returns the number of Customers without an assigned Customer Category
    /// <summary>
    /// GetTotalCustomersWithoutCategory.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetTotalCustomersWithoutCategory(): Integer
    var
        Customer: record Customer;
    begin
        Customer.SetRange("Customer Category Code_REN", '');
        exit(customer.Count());
    end;

    /// <summary>
    /// GetSalesAmount.
    /// </summary>
    /// <param name="CustomerCategoryCode">Code[20].</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure GetSalesAmount(CustomerCategoryCode: Code[20]): Decimal
    var
        SalesLine: Record "Sales Line";
        Customer: record Customer;
        TotalAmount: Decimal;
    begin
        Customer.SetCurrentKey("Customer Category Code_REN");
        Customer.SetRange("Customer Category Code_REN", CustomerCategoryCode);
        if Customer.FindSet() then
            repeat
                SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                SalesLine.SetRange("Sell-to Customer No.", Customer."No.");
                if SalesLine.FindSet() then
                    repeat
                        TotalAmount += SalesLine."Line Amount";
                    until SalesLine.Next() = 0;
            until Customer.Next() = 0;
        exit(TotalAmount);
    end;
}