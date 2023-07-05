/// <summary>
/// TableExtension ItemLedgerEntryExtension_REN (ID 50101) extends Record Item Ledger Entry.
/// </summary>
tableextension 50101 "ItemLedgerEntryExtension_REN" extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "Customer Category Code_REN"; Code[20])
        {
            TableRelation = "Customer Category_REN".Code;
            Caption = 'Customer Category';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(FK; "Customer Category Code_REN")
        {
        }
    }
}