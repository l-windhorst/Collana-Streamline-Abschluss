page 50105 "Webshop Order Archive List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Webshop Archive Header";
    CardPageId = "Webshop Order Archive Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Order No."; Rec."Order No.")
                {
                    ToolTip = 'Specifies the value of the Order No. field.', Comment = '%';
                }
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Specifies the value of the Customer field.', Comment = '%';
                }
                field("Total Price"; Rec."Total Price")
                {
                    ToolTip = 'Specifies the value of the Total Price field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Comment Available"; Rec."Comment Available")
                {
                    ToolTip = 'Specifies the value of the Comment Available field.', Comment = '%';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Source Code field.', Comment = '%';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Creation)
        {
            action("Webshop Orders")
            {
                RunObject = Page "Webshop Order List";
                Image = List;
                Promoted = true;
                PromotedCategory = Process;
            }
            action(Customers)
            {
                RunObject = page "Customer List";
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;
            }
            action(Vendor)
            {
                RunObject = page "Vendor List";
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;
            }
            action(Discount)
            {
                RunObject = page "Webshop Order Discount";
                Image = Discount;
                Promoted = true;
                PromotedCategory = Process;
            }
            action("Sales Orders")
            {
                RunObject = page "Sales Order List";
                Image = JobSalesInvoice;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
}