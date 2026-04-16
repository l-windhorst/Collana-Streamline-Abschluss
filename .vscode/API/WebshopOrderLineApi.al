page 50109 "Webshop Order Line Api"
{
    PageType = Api;
    ApplicationArea = All;
    EntitySetName = 'webshopOrderLines';
    EntityName = 'webshopOrderLine';
    APIPublisher = 'dev';
    APIGroup = 'CollanaStreamlineApi';
    DelayedInsert = true;
    APIVersion = 'v2.0', 'v1.0';
    SourceTable = "Webshop Order Line";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(orderNo; Rec."Order No.")
                { }
                field(lineNo; Rec."Line No.")
                { }
                field(itemName; Rec."Item Name")
                { }
                field(itemDescription; Rec."Item Description")
                { }
                field(unitPrice; Rec."Unit Price")
                { }
                field(quantity; Rec.Quantity)
                { }
                field(inStock; Rec."In Stock")
                { }
                field(vendor; Rec.Vendor)
                { }
                field(price; Rec.Price)
                { }
                field(discountCode; Rec."Discount Code")
                { }
                field(discount; Rec.Discount)
                { }
                field(priceAfterDiscount; Rec."Price After Discount")
                { }
                field(totalPrice; Rec."Total Price")
                { }
            }
        }
    }
}