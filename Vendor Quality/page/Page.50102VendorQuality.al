/// <summary>
/// Page Vendor Quality Card_REN (ID 50102).
/// </summary>
page 50102 "Vendor Quality Card_REN"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Vendor Quality_REN";
    Caption = 'Vendor Quality Card';
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Vendor No."; xrec."Vendor No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vendor Name"; xrec."Vendor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vendor Activity Description"; xrec."Vendor Activity Description")
                {
                    ApplicationArea = All;
                }
                field(Rate; xrec.Rate)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = Strong;
                }
                field(UpdateDate; xrec.UpdateDate)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(Scoring)
            {
                Caption = 'Score';
                field(ScoreItemQuality; xrec.ScoreItemQuality)
                {
                    ApplicationArea = All;
                }
                field(ScoreDelivery; xrec.ScoreDelivery)
                {
                    ApplicationArea = All;
                }
                field(ScorePackaging; xrec.ScorePackaging)
                {
                    ApplicationArea = All;
                }
                field(ScorePricing; xrec.ScorePricing)
                {
                    ApplicationArea = All;
                }
            }
            group(Financials)
            {
                Caption = 'Financials';
                field(InvoicedYearN; xrec.InvoicedYearN)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(InvoicedYearN1; xrec.InvoicedYearN1)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(InvoicedYearN2; xrec.InvoicedYearN2)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(DueAmount; xrec.DueAmount)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = Attention;
                }
                field(AmountNotDue; xrec.AmountNotDue)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Insert() then;
    end;

    trigger OnAfterGetRecord()
    var
        VendorQualityMgt: Codeunit VendorQualityMgt_REN;
    begin
        VendorQualityMgt.UpdateVendorQualityStatistics(Rec);
    end;

    local procedure Insert(): Boolean
    begin
        Error('Procedure Insert not implemented.');
    end;
}