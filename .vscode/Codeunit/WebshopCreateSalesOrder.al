codeunit 50100 "Webshop Create Sales Order"
{
    TableNo = "Webshop Order Header";
    trigger OnRun()
    begin
        ClearAll();
        OrderHeader := Rec;
        Rec.TestField("Order No. for Sales");
        Rec.TestField("E-Mail");
        Rec.TestField("Customer No.");
        Rec.TestField(Customer);
        Rec.TestField(Address);
        Rec.TestField("Post Code");
        Rec.TestField(Country);
        Window.Open('#1#');
        CustomerInfo.Get(OrderHeader."Customer No.");
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader."No." := OrderHeader."Order No. for Sales";
        SalesHeader."Sell-to Customer No." := OrderHeader."Customer No.";
        SalesHeader.Validate("Sell-to Customer Name", OrderHeader.Customer);
        SalesHeader."Bill-to Contact" := OrderHeader.Contact;
        SalesHeader."Ship-to Contact" := OrderHeader.Contact;
        SalesHeader."Sell-to Contact" := OrderHeader.Contact;
        SalesHeader."Sell-to Contact" := OrderHeader.Contact;
        SalesHeader."Bill-to Contact No." := OrderHeader."Contact Code";
        SalesHeader."Sell-to Contact No." := OrderHeader."Contact Code";
        SalesHeader."Order Date" := OrderHeader."Order Date";
        SalesHeader."Posting Date" := OrderHeader."Order Date";//Validate?
        SalesHeader."Shipment Date" := OrderHeader."Order Date";
        SalesHeader."Due Date" := OrderHeader."Order Date";
        SalesHeader."Document Date" := OrderHeader."Order Date";
        SalesHeader."Prepayment Due Date" := OrderHeader."Order Date";
        SalesHeader."VAT Reporting Date" := OrderHeader."Order Date";
        SalesHeader."Sell-to E-Mail" := OrderHeader."E-Mail";
        Test := CustomerInfo."Payment Terms Code";
        SalesHeader.Validate("Payment Terms Code", CustomerInfo."Payment Terms Code");
        SalesHeader.Validate("Prepmt. Payment Terms Code");
        Rec."Sales Order Created" := true;
        SalesHeader.Insert();
        OrderLine.LockTable();
        OrderLine.Reset();
        OrderLine.SetRange("Order No.", OrderHeader."Order No.");
        if OrderLine.FindSet() then
            repeat
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine."Document Type" := SalesLine."Document Type"::Order;
                ItemInfo.Get(OrderLine."Item Name");
                CustomerInfo.Get(Rec."Customer No.");
                // SalesLine."Document No." := OrderHeader."Order No. for Sales";
                SalesLine."Line No." := OrderLine."Line No.";
                SalesLine.Type := SalesLine.Type::Item;
                SalesLine."No." := OrderLine."Item Name";
                SalesLine.Description := OrderLine."Item Description";
                SalesLine."Gen. Bus. Posting Group" := CustomerInfo."Gen. Bus. Posting Group";
                SalesLine."VAT Bus. Posting Group" := CustomerInfo."VAT Bus. Posting Group";
                SalesLine."Gen. Prod. Posting Group" := ItemInfo."Gen. Prod. Posting Group";
                SalesLine."VAT Prod. Posting Group" := ItemInfo."VAT Prod. Posting Group";
                SalesLine."Unit of Measure Code" := ItemInfo."Base Unit of Measure";
                SalesLine."Unit of Measure" := ItemInfo."Base Unit of Measure";
                SalesLine."Unit Price" := OrderLine."Unit Price";
                SalesLine.Validate(Quantity, OrderLine.Quantity);
                SalesLine.Validate("Line Discount %", OrderLine.Discount);
                SalesLine.Insert();
            until OrderLine.Next() = 0;
        Window.Update(1, Text001);
        Window.Close();
        Rec.Delete();//verweist auf OnDelete in Table wird sonst nicht ausgefühert
        OpenSalesOrder();
    end;

    var
        Test: Code[20];
        OrderHeader: Record "Webshop Order Header";
        OrderLine: Record "Webshop Order Line";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Window: Dialog;
        CustomerInfo: Record Customer;
        ContactInfo: Record Contact;
        ItemInfo: Record Item;
        SalesOrderCard: Page "Sales Order";
        NoSeriesMgt: Codeunit "No. Series";
        SalesSetup: Record "Sales & Receivables Setup";
        Text001: Label 'The Sales Order was created successfully.';
        Text002: Label 'Do you want to open the created Sales Order now?';

    local procedure OpenSalesOrder()
    var
    begin
        if Confirm(Text002, true) then begin
            SalesHeader.Reset();
            SalesHeader.SetRange("No.", SalesHeader."No.");
            if SalesHeader.FindFirst() then
                PAGE.Run(PAGE::"Sales Order", SalesHeader);
        end;
    end;
}