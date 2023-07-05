/// <summary>
/// Page Gift Campaign List_REN (ID 50103).
/// </summary>
page 50103 "Gift Campaign List_REN"
{
    PageType = List;
    SourceTable = GiftCampaign_REN;
    UsageCategory = Lists;
    Caption = 'Gift Campaigns';
    ApplicationArea = All;
    AdditionalSearchTerms = 'promotions, marketing';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CustomerCategoryCode; xrec.CustomerCategoryCode)
                {
                    ApplicationArea = All;
                }
                field(ItemNo; xrec.ItemNo)
                {
                    ApplicationArea = All;
                }
                field(StartingDate; xrec.StartingDate)
                {
                    ApplicationArea = All;
                }
                field(EndingDate; xrec.EndingDate)
                {
                    ApplicationArea = All;
                }
                field(MinimumOrderQuantity; xrec.MinimumOrderQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
                field(GiftQuantity; xrec.GiftQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
                field(Inactive; xrec.Inactive)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    views
    {
        view(ActiveCampaigns)
        {
            Caption = 'Active Gift Campaigns';
            Filters = where(Inactive = const(false));
        }
        view(InactiveCampaigns)
        {
            Caption = 'Inactive Gift Campaigns';
            Filters = where(Inactive = const(true));
        }
    }
}