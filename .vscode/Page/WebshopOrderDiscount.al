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
                    Caption = 'Discount Code No.';
                    ToolTip = 'Specifies the value of the Discount Code No. field.', Comment = '%';
                }
                field("Discount Code"; Rec."Discount Code")
                {
                    Caption = 'Discount Code';
                    ToolTip = 'Specifies the value of the Discount Code field.', Comment = '%';
                }
                field(Discount; Rec.Discount)
                {
                    Caption = 'Discount in %';
                    ToolTip = 'Specifies the value of the Discount field.', Comment = '%';
                }
            }
        }
    }
}