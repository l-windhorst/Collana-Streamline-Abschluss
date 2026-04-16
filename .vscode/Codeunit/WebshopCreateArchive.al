codeunit 50102 "Webshop Create Archive"
{
    TableNo = "Webshop Order Header";
    trigger OnRun()
    begin
        ClearAll();
        OrderHeader := Rec;
        Rec.TestField("E-Mail");
        Rec.TestField("Customer No.");
        Rec.TestField(Customer);
        Rec.TestField(Address);
        Rec.TestField("Post Code");
        Rec.TestField(Country);
        Window.Open('#1#');//+ Text001, OrderHeader."Order No.");
        ArchiveHeader.TransferFields(OrderHeader);
        ArchiveHeader.Insert();
        OrderLine.LockTable();
        OrderLine.Reset();
        OrderLine.SetRange("Order No.", OrderHeader."Order No.");
        if OrderLine.FindSet() then
            repeat
                ArchiveLine.TransferFields(OrderLine); //Beides möglich
                // ArchiveLine."Order No." := OrderLine."Order No.";
                // ArchiveLine."Line No." := OrderLine."Line No.";
                // ArchiveLine."Item Name" := OrderLine."Item Name";
                // ArchiveLine."Unit Price" := OrderLine."Unit Price";
                // ArchiveLine.Quantity := OrderLine.Quantity;
                // ArchiveLine."In Stock" := OrderLine."In Stock";
                // ArchiveLine.Vendor := OrderLine.Vendor;
                // ARchiveLine.Price := OrderLine.Price;
                // ArchiveLine."Discount Code" := OrderLine."Discount Code";
                // ArchiveLine.Discount := OrderLine.Discount;
                // ArchiveLine."Price After Discount" := OrderLine."Price After Discount";
                // ArchiveLine."Total Price" := OrderLine."Total Price";
                ArchiveLine.Insert();
            until OrderLine.Next() = 0;
        Window.Update(1, Text002 + OrderHeader."Order No.");
        Window.Close();
    end;

    var
        OrderHeader: Record "Webshop Order Header";
        OrderLine: Record "Webshop Order Line";
        ArchiveHeader: Record "Webshop Archive Header";
        ArchiveLine: Record "Webshop Archive Line";
        Window: Dialog;
        Text002: Label 'The Archive has been created with the No. ';
}