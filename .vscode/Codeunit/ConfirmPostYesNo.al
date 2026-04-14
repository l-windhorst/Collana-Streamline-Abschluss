codeunit 50101 "Webshop Confirm Post Yes No"
{
    TableNo = "Webshop Order Header";
    trigger OnRun()
    begin
        OrderHeader.Copy(Rec);
        if Confirm(Text001, true) then begin
            CheckStatus();
            CreateArchive.Run(OrderHeader);
            CreateSalesOrder.Run(OrderHeader);//OrderHeader in kalmmer hat zu tun mit der TableNo in der Codeunit
            Commit();
        end;
    end;

    var
        Text001: Label 'Do you want to post the order into a Sales Order?';
        Text002: Label 'The order status must be set to "Order Completed" current status is %1';
        CreateSalesOrder: Codeunit "Webshop Create Sales Order";
        CreateArchive: Codeunit "Webshop Create Archive";
        OrderHeader: Record "Webshop Order Header";

    local procedure CheckStatus()

    begin
        // Message('Current Status is %1', OrderHeader.Status);
        if OrderHeader.Status <> OrderHeader.Status::"Order Completed" then
            Error(Text002, OrderHeader.Status);
    end;
}