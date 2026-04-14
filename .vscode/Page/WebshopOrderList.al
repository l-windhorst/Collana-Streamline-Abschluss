page 50101 "Webshop Order List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Webshop Order Header";
    CardPageId = "Webshop Order Card";
    Caption = 'Webshop Order List';

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
                    ToolTip = 'Specifies whether a comment is available for the order.', Comment = '%';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Navigation)
        {
            action(Customers)
            {
                Caption = 'Customers';
                Promoted = true;
                PromotedCategory = Process;
                Image = Customer;
                RunObject = Page "Customer List";
            }
            action(Vendor)
            {
                Caption = 'Vendors';
                Promoted = true;
                PromotedCategory = Process;
                Image = Vendor;
                RunObject = Page "Vendor List";
            }
            action(Sales)
            {
                Caption = 'Sales Orders';
                Promoted = true;
                PromotedCategory = Process;
                Image = JobSalesInvoice;
                RunObject = Page "Sales Order List";
            }
            action(Discounts)
            {
                Caption = 'Discounts';
                Promoted = true;
                PromotedCategory = Process;
                Image = Discount;
                RunObject = Page "Webshop Order Discount";
            }
        }
    }
}