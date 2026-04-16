page 50108 "Webshop Order Header Api"//braucht man um mit Postman verbindung herstellen zu können
{
    PageType = API;
    ApplicationArea = All;
    EntitySetName = 'webshopOrderHeaders';
    EntityName = 'webshopOrderHeader';
    APIPublisher = 'dev';
    APIGroup = 'CollanaStreamlineApi';
    DelayedInsert = true;
    SourceTable = "Webshop Order Header";
    APIVersion = 'v2.0', 'v1.0';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(customerNo; Rec."Customer No.")
                { }
                field(customer; Rec.Customer)
                { }
                field(address; Rec.Address)
                { }
                field(address2; Rec."Address 2")
                { }
                field(country; Rec.Country)
                { }
                field(city; Rec.City)
                { }
                field(eMail; Rec."E-Mail")
                { }
                field(paymentMethod; Rec."Payment Method")
                { }
                field(overallAmount; Rec."Overall Amount")
                { }
                field(orderDate; Rec."Order Date")
                { }
                field(contactCode; Rec."Contact Code")
                { }
                field(contact; Rec.Contact)
                { }
                field(postCode; Rec."Post Code")
                { }
                field(comment; Rec.Comment)
                { }
                field(commentAvailable; Rec."Comment Available")
                { }
                field(salesOrderCreated; Rec."Sales Order Created")
                { }
                field(status; Rec.Status)
                { }
                field(totalPrice; Rec."Total Price")
                { }
            }
            part(OrderLines; "Webshop Order Line Api")
            {
                EntityName = 'webshopOrderLine';
                EntitySetName = 'webshopOrderLines';

                SubPageLink = "Order No." = field("Order No.");
            }
        }
    }
}