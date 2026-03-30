page 50106 "Webshop Order Discount"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Webshop Order Discount";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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