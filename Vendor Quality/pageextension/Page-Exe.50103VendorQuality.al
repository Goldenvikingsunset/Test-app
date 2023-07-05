/// <summary>
/// PageExtension VendorCardExt_REN (ID 50101) extends Record Vendor Card.
/// </summary>
pageextension 50101 VendorCardExt_REN extends "Vendor Card"
{
    actions
    {
        addafter("Co&mments")
        {
            action(QualityClassification)
            {
                Caption = 'Quality Classification';
                ApplicationArea = All;
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Vendor Quality Card_REN";
                RunPageLink = "Vendor No." = field("No.");
            }
        }
    }
}