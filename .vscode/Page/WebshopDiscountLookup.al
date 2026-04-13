page 50107 "Webshop Discount Lookup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Webshop Order Discount";
    // Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Discounts)
            {
                field("Discount Code No."; Rec."Discount Code No.")
                {
                    ToolTip = 'Specifies the value of the Discount Code No. field.', Comment = '%';
                }
                field("Discount Code"; Rec."Discount Code")
                {
                    ToolTip = 'Specifies the value of the Discount Code field.', Comment = '%';
                }
                field(Discount; Rec.Discount)
                {
                    ToolTip = 'Specifies the value of the Discount field.', Comment = '%';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}