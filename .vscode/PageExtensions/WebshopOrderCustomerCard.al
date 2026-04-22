pageextension 50101 "Webshop Order Customer Card" extends "Customer Card"
{
    layout
    {
        addbefore("Name")
        {
            field(Birthday; Rec.Birthday)
            {
                ToolTip = 'Specifies the value of the Birthday field.', Comment = '%';
                ApplicationArea = All;
            }
        }
    }
}