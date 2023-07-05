/// <summary>
/// Codeunit CustomerCategoryInstall_REN (ID 50105).
/// </summary>
codeunit 50105 CustomerCategoryInstall_REN
{
    Subtype = Install;
    trigger OnInstallAppPerCompany();
    var
        archivedVersion: Text;
        CustomerCategory: Record "Customer Category_REN";
        RENSetup: Record "REN Extension Setup";
    begin
        archivedVersion := NavApp.GetArchiveVersion;
        if archivedVersion = '1.0.0.0' then begin
            NavApp.RestoreArchiveData(Database::"Customer Category_REN");
            NavApp.RestoreArchiveData(Database::Customer);
            NavApp.RestoreArchiveData(Database::"REN Extension Setup");
            NavApp.RestoreArchiveData(Database::GiftCampaign_REN);
            NavApp.RestoreArchiveData(Database::"Vendor Quality_REN");
            NavApp.DeleteArchiveData(Database::"Customer Category_REN");
            NavApp.DeleteArchiveData(Database::Customer);
            NavApp.DeleteArchiveData(Database::"REN Extension Setup");
            NavApp.DeleteArchiveData(Database::GiftCampaign_REN);
            NavApp.DeleteArchiveData(Database::"Vendor Quality_REN");
        end;
        if CustomerCategory.IsEmpty() then
            InsertDefaultCustomerCategory();
        if RENSetup.IsEmpty() then
            InsertDefaultSetup();
    end;

    // Insert the GOLD, SILVER, BRONZE reward levels
    local procedure InsertDefaultCustomerCategory();
    begin
        InsertCustomerCategory('TOP', 'Top Customer', false);
        InsertCustomerCategory('MEDIUM', 'Standard Customer', true);
        InsertCustomerCategory('BAD', 'Bad Customer', false);
    end;

    // Create and insert a Customer Category record
    local procedure InsertCustomerCategory(ID: Code[30]; Description: Text[250]; Default: Boolean);
    var
        CustomerCategory: Record "Customer Category_REN";
    begin
        CustomerCategory.Init();
        CustomerCategory.Code := ID;
        CustomerCategory.Description := Description;
        CustomerCategory.Default := Default;
        CustomerCategory.Insert();
    end;

    local procedure InsertDefaultSetup()
    var
        RENSetup: Record "REN Extension Setup";
    begin
        RENSetup.Init();
        RENSetup."Minimum Accepted Vendor Rate" := 6;
        RENSetup."Gift Tolerance Qty" := 2;
        RENSetup.Insert();
    end;
}