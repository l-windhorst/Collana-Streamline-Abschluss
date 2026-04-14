codeunit 50100 "Webshop Create Sales Order"//Aus Webshop Order eine Sales Order erstellen
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
        Window.Open('#1#################################\\');//von Webshop Nos in Sales Nos zeigen lassen
        GetNextNo();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader."No." := OrderHeader."Order No. for Sales";
        SalesHeader."Sell-to Customer No." := OrderHeader."Customer No.";
        SalesHeader.Validate("Sell-to Customer Name", OrderHeader.Customer);
        // SalesHeader."Bill-to Customer No." := OrderHeader.Customer;
        // SalesHeader."Ship-to Name" := OrderHeader.Customer;
        // SalesHeader."Sell-to Customer Name" := OrderHeader.Customer;
        SalesHeader."Bill-to Address" := OrderHeader.Address;
        SalesHeader."Ship-to Address" := OrderHeader.Address;
        SalesHeader."Sell-to Address" := OrderHeader.Address;
        SalesHeader."Bill-to Address 2" := OrderHeader."Address 2";
        SalesHeader."Ship-to Address 2" := OrderHeader."Address 2";
        SalesHeader."Sell-to Address 2" := OrderHeader."Address 2";
        SalesHeader."Bill-to City" := OrderHeader.City;
        SalesHeader."Ship-to City" := OrderHeader.City;
        SalesHeader."Sell-to City" := OrderHeader.City;
        SalesHeader."Bill-to Post Code" := OrderHeader."Post Code";
        SalesHeader."Ship-to Post Code" := OrderHeader."Post Code";
        SalesHeader."Sell-to Post Code" := OrderHeader."Post Code";
        SalesHeader."VAT Country/Region Code" := OrderHeader.Country;
        SalesHeader."Bill-to Country/Region Code" := OrderHeader.Country;
        SalesHeader."Sell-to Country/Region Code" := OrderHeader.Country;
        SalesHeader."Ship-to Country/Region Code" := OrderHeader.Country;
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
                // SalesLine."Document No." := OrderHeader."Order No. for Sales";
                SalesLine."Line No." := OrderLine."Line No.";
                SalesLine.Type := SalesLine.Type::Item;
                SalesLine."No." := OrderLine."Item Name";
                SalesLine.Description := OrderLine."Item Description";
                CustomerInfo.Get(Rec."Customer No.");
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
        Window.Update(1, 'The Sales Order was created successfully.');
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

    local procedure OpenSalesOrder()
    var
    begin
        if Confirm('Do you want to open the created Sales Order now?', true) then begin
            SalesHeader.SetRange("No.", SalesHeader."No.");
            if SalesHeader.FindFirst() then
                PAGE.Run(PAGE::"Sales Order", SalesHeader);
        end;
    end;

    local procedure GetNextNo()
    var
    begin
        if OrderHeader."Order No. for Sales" = '' then begin
            OrderHeader.TestField("Order No. for Sales");
            OrderHeader."Order No. for Sales" := NoSeriesMgt.GetNextNo(SalesSetup."Webshop Order for Sales Nos.");
            OrderHeader.Modify();
            Commit();
        end;
    end;
}