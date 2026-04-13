page 50100 "Webshop Order Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Webshop Order Header";
    Caption = 'Webshop Order Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Order No. for Sales"; Rec."Order No. for Sales")
                {
                    ToolTip = 'Specifies the value of the Order No. for Sales field.', Comment = '%';
                }
                field("Order No."; Rec."Order No.")
                {
                    ToolTip = 'Specifies the value of the Order No. field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                    Importance = Promoted;
                }
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Specifies the value of the Customer field.', Comment = '%';
                    Importance = Promoted;
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies the value of the Address 2 field.', Comment = '%';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.', Comment = '%';
                    Importance = Promoted;
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country field.', Comment = '%';
                }
                field(Contact; Rec.Contact)
                {
                    ToolTip = 'Specifies the value of the Contact field.', Comment = '%';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the value of the E-Mail field.', Comment = '%';
                }
                field(Birthday; Rec.Birthday)
                {
                    ToolTip = 'Specifies the value of the Birthday field.', Comment = '%';
                    Importance = Additional;
                }
                field("Overall Amount"; Rec."Overall Amount")
                {
                    ToolTip = 'Specifies the value of the Overall Amount field.', Comment = '%';
                }
                field("Total Price"; Rec."Total Price")
                {
                    ToolTip = 'Specifies the value of the Total Price field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ToolTip = 'Specifies the value of the Payment Method field.', Comment = '%';
                }
                field(Comment; Rec.Comment)
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Comment field.', Comment = '%';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Source Code field.', Comment = '%';
                    Importance = Additional;
                }
            }
            part("Webshop Order Subpage"; "Webshop Order Subpage")
            {
                Caption = 'Order Lines';
                SubPageLink = "Order No." = field("Order No.");
                SubPageView = sorting("Order No.", "Line No.");
                ToolTip = 'Displays the details of the order lines associated with the order.', Comment = '%';
            }
        }
    }


    actions
    {
        area(Navigation)
        {
            action(Customers)
            {
                RunObject = Page "Customer List";
                Image = Customer;
                Caption = 'Customers';
                Promoted = true;
                PromotedCategory = Process;
            }
            action(Vendor)
            {
                RunObject = Page "Vendor List";
                Image = Vendor;
                Caption = 'Vendors';
                Promoted = true;
                PromotedCategory = Process;

            }
            action(Discounts)
            {
                RunObject = Page "Webshop Order Discount";
                Image = Discount;
                Caption = 'Discounts';
                Promoted = true;
                PromotedCategory = Process;
            }
            action(Sales)
            {
                RunObject = Page "Sales Order List";
                Image = JobSalesInvoice;
                Caption = 'Sales Orders';
                Promoted = true;
                PromotedCategory = Process;
            }

            action(CreateSalesOrder)
            {
                Caption = 'Create Sales Order';
                Image = NewDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //CreateSalesOrder procedure
                end;
            }

        }
    }
}