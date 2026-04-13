page 50102 "Webshop Order Subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Webshop Order Line";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Order No."; Rec."Order No.")
                {
                    ToolTip = 'Specifies the value of the Order No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Item Name"; Rec."Item Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field.', Comment = '%';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ToolTip = 'Specifies the value of the Item Description field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("In Stock"; Rec."In Stock")
                {
                    ToolTip = 'Specifies the value of the In Stock field.', Comment = '%';
                }
                field(Vendor; Rec.Vendor)
                {
                    ToolTip = 'Specifies the value of the Vendor field.', Comment = '%';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.', Comment = '%';
                }
                field("Discount Code"; Rec."Discount Code")
                {
                    ToolTip = 'Specifies the value of the Discount Code field.', Comment = '%';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Discount: Record "Webshop Order Discount";
                    begin
                        if Page.RunModal(Page::"Webshop Discount Lookup", Discount) = Action::LookupOK then begin
                            Rec.Validate("Discount Code", Discount."Discount Code");
                            Rec.Validate(Discount, Discount.Discount);
                        end;
                    end;
                }
                field(Discount; Rec.Discount)
                {
                    Caption = 'Discount in %';
                    ToolTip = 'Specifies the value of the Discount field.', Comment = '%';
                }
                field("Price After Discount"; Rec."Price After Discount")
                {
                    ToolTip = 'Specifies the value of the Price After Discount field.', Comment = '%';
                }
            }
            field("Total Price"; Rec."Total Price")
            {
                ToolTip = 'Specifies the value of the Total Price field.', Comment = '%';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Items)
            {
                RunObject = Page "Item List";
                Image = Item;
            }
        }
    }
    trigger OnAfterGetCurrRecord()//generell das bekommen des letzen Wertes in Total Price
                                  //löst aus immer wenn was Validiert wird
    begin
        Rec.CalculateTotalPrice();
        Rec.GetTotalAmount();
    end;

    trigger OnAfterGetRecord()//erhöhung des Preises basierend auf die Lines und deren Preise
    begin
        Rec.CalculateTotalPrice();
        Rec.GetTotalAmount();
    end;
}