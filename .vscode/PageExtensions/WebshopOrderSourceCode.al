pageextension 50104 "Webshop Order Source Code" extends "Source Code Setup"
{
    layout
    {
        addafter("Cost Accounting")
        {
            group(WebshopOrderSourceCodeGroup)
            {
                Caption = 'Webshop Order Source Code';


                field("Webshop Order Order No."; Rec."Webshop Order Order No.")
                {
                    ToolTip = 'Specifies the value of the Webshop Order Order No. field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}