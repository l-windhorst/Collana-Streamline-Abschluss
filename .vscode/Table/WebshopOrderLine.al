table 50101 "Webshop Order Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = SystemMetadata;
            Editable = false;

        }
        field(3; "Item Name"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item";
            trigger OnValidate()

            begin
                if "Item Name" <> xRec."Item Name" then begin
                    // CheckLineNo();
                    ItemInfo.Get("Item Name");
                    Rec."Item Description" := ItemInfo.Description;
                    Rec."Unit Price" := ItemInfo."Unit Price";
                    Rec.Vendor := ItemInfo."Vendor Name";
                    CheckItemInStock();
                    Validate(Quantity);
                    // Rec.Modify();
                end;
            end;
        }
        field(4; "Item Description"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; "Unit Price"; Decimal)
        {
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(6; Quantity; Integer)
        {
            DataClassification = CustomerContent;
            MinValue = 0;

            trigger OnValidate()
            begin
                CalculatePrice();
            end;
        }
        field(7; "In Stock"; Boolean)
        {
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(8; Vendor; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(9; Price; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(10; "Discount Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(11; Discount; Integer)
        {
            DataClassification = CustomerContent;

        }
        field(12; "Price After Discount"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(14; "Total Price"; Decimal)
        {
            DataClassification = SystemMetadata;
            Editable = false;

        }
    }

    keys
    {
        key(PK; "Order No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        ItemInfo: Record "Item";
        Discount: Record "Webshop Order Discount";
        Text001: Label 'You´ve changed the the Order Line. The Order Status is now "In Process".';
        Text002: Label 'You can´t complete the Order because one line is missing quantity';

    local procedure GetNextLineNo(): Integer
    var
        LineNo: Integer;
        OrderLine: Record "Webshop Order Line";
    begin
        OrderLine.Reset();
        OrderLine.SetRange("Order No.", Rec."Order No.");
        if OrderLine.FindLast() then
            LineNo := OrderLine."Line No." + 1
        else
            LineNo := 1;
        exit(LineNo);
    end;

    local procedure CheckLineNo()
    var
    begin
        if "Item Name" <> xRec."Item Name" then
            Rec."Line No." := GetNextLineNo();
    end;

    local procedure CheckItemInStock()
    var
    begin
        ItemInfo.CalcFields(Inventory);
        if ItemInfo.Inventory <= 0 then
            Rec."In Stock" := false
        else
            Rec."In Stock" := true;
    end;

    local procedure CalculatePrice()
    var
    begin
        // if Rec.Quantity <> xRec.Quantity then
        Rec.Price := Rec."Unit Price" * Rec.Quantity;
    end;

    local procedure CalculatePriceAfterDiscount()
    var
    begin
        if Rec.Discount <> 0 then
            Rec."Price After Discount" := Rec.Price - (Rec.Price * Rec.Discount / 100)
        else
            Rec."Price After Discount" := Rec.Price;
    end;

    procedure CalculateTotalPrice()
    var
        TotalPrice: Decimal;
        OrderLine: Record "Webshop Order Line";
        OrderHeader: Record "Webshop Order Header";
    begin
        OrderLine.Reset();
        OrderLine.SetRange("Order No.", Rec."Order No.");
        if OrderLine.FindFirst() then begin
            OrderLine.CalcSums("Price After Discount");
            TotalPrice := OrderLine."Price After Discount";
            Rec."Total Price" := TotalPrice;
            if OrderHeader.Get(Rec."Order No.") then begin
                OrderHeader."Total Price" := TotalPrice;
                OrderHeader.Modify();
            end;
        end
        else
            TotalPrice := 0;
    end;

    procedure GetTotalAmount()
    var
        Amount: Integer;
        OrderLine: Record "Webshop Order Line";
        OrderHeader: Record "Webshop Order Header";
    begin
        OrderLine.Reset();
        OrderLine.SetRange("Order No.", Rec."Order No.");
        if OrderLine.FindFirst() then begin
            OrderLine.CalcSums(Quantity);
            Amount := OrderLine.Quantity;
            if OrderHeader.Get(Rec."Order No.") then begin
                OrderHeader."Overall Amount" := Amount;
                OrderHeader.Modify();
            end;
        end
        else
            Amount := 0;
    end;

    local procedure GetBirthdayDiscount()
    var
        OrderHeader: Record "Webshop Order Header";
        Discount: Record "Webshop Order Discount";
    begin
        OrderHeader.Get(Rec."Order No.");
        if OrderHeader.Birthday = WorkDate() then begin
            Discount.Reset();
            Discount.SetRange("Discount Code", 'BIRTHDAY');
            if Discount.FindFirst() then begin
                Rec.Validate("Discount Code", Discount."Discount Code");
                Rec.Validate(Discount, Discount.Discount);
            end;
        end;
    end;



    local procedure CheckOrderLine()
    var
        OrderHeader: Record "Webshop Order Header";
        IsChanged: Boolean;
    begin
        OrderHeader.Get(Rec."Order No.");
        if OrderHeader.Status = OrderHeader.Status::"Order Completed" then begin
            if Rec.Quantity <> xRec.Quantity then begin
                OrderHeader.Status := OrderHeader.Status::"in Process";
                OrderHeader.Modify();
                IsChanged := true;
            end;
            if Rec."Item Name" <> xRec."Item Name" then begin
                OrderHeader.Status := OrderHeader.Status::"in Process";
                OrderHeader.Modify();
                IsChanged := true;
            end;
            if Rec."Discount Code" <> xRec."Discount Code" then begin
                OrderHeader.Status := OrderHeader.Status::"in Process";
                OrderHeader.Modify();
                IsChanged := true;
            end;
            if Rec."Discount Code" <> xRec."Discount Code" then begin
                OrderHeader.Status := OrderHeader.Status::"in Process";
                OrderHeader.Modify();
                IsChanged := true;
            end;
        end;
        if IsChanged = true then
            Message(Text001);
    end;

    trigger OnInsert()
    begin
        Rec."Line No." := GetNextLineNo();
        GetBirthdayDiscount();
    end;

    trigger OnModify()
    begin
        CalculatePriceAfterDiscount();
        CheckOrderLine();
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}