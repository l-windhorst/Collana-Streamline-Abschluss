pageextension 50102 "Webshop Order Nos." extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field("Discount Nos."; Rec."Discount Nos.")
            {
                ToolTip = 'Specifies the value of the Discount Nos. field.', Comment = '%';
                ApplicationArea = All;
            }
            field("Webshop Order Nos."; Rec."Webshop Order Nos.")
            {
                ToolTip = 'Specifies the value of the Webshop Order Nos. field.', Comment = '%';
                ApplicationArea = All;
            }
            field("Order for Sales Nos."; Rec."Webshop Order for Sales Nos.")
            {
                ToolTip = 'Specifies the value of the Webshop Order for Sales Nos. field.', Comment = '%';
                ApplicationArea = All;
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