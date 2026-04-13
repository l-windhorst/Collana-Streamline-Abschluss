pageextension 50100 "Webshop Vendor Name" extends "Item Card"
{
    layout
    {
        addafter("Vendor No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ToolTip = 'Specifies the name of the vendor.', Comment = '%';
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