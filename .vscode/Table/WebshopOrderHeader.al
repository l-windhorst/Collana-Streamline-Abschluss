table 50100 "Webshop Order Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            DataClassification = SystemMetadata;
        }
        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer";
            trigger OnValidate()
            var
                CustomerInfo: Record "Customer";
                SourceCodeSetup: Record "Source Code Setup";
            begin
                if "Customer No." <> '' then begin
                    CustomerInfo.Get("Customer No.");
                    "Customer No." := CustomerInfo."No.";
                    Customer := CustomerInfo."Name";
                    Rec.Address := CustomerInfo."Address";
                    Rec."Address 2" := CustomerInfo."Address 2";
                    Rec.City := CustomerInfo."City";
                    Rec."Post Code" := CustomerInfo."Post Code";
                    Rec.Country := CustomerInfo."Country/Region Code";
                    Rec."Contact Code" := CustomerInfo."Primary Contact No.";
                    Rec.Contact := CustomerInfo."Contact";
                    Rec."E-Mail" := CustomerInfo."E-Mail";
                    Rec.Birthday := CustomerInfo."Birthday";
                    Rec."Order Date" := WorkDate();
                    SourceCodeSetup.Get();
                    Rec."Source Code" := SourceCodeSetup."Webshop Order Order No.";
                end;
            end;
        }
        field(3; Customer; Text[100])
        {
            DataClassification = CustomerContent;

        }
        field(4; Address; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Address 2"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(7; City; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(8; "Post Code"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(9; Country; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(10; Contact; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(11; "Order Date"; Date)
        {
            DataClassification = SystemMetadata;
        }
        field(12; "E-Mail"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(13; Birthday; Date)
        {
            DataClassification = CustomerContent;
        }
        field(14; "Overall Amount"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(15; "Total Price"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(16; "Status"; Enum "Webshop Status Enum")
        {
            DataClassification = SystemMetadata;
        }
        field(17; "Payment Method"; Text[50])
        {
            DataClassification = SystemMetadata;
        }
        field(18; "Comment"; Text[255])
        {
            DataClassification = CustomerContent;

        }
        field(19; "Source Code"; Code[20])
        {
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(20; "Order No. for Sales"; Code[20])
        {
            DataClassification = SystemMetadata;
        }
        field(21; "Comment Available"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(22; "Contact Code"; Code[20])//Wenn contact ausgewählt Lookup
        {
            DataClassification = CustomerContent;
        }
        field(23; "Sales Order Created"; Boolean)
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Order No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        GetWebOrderNos();
        GetWebSalesOrderNos();
    end;

    trigger OnModify()
    begin
        GetCommentValue();
        CheckOrderHeader();
    end;

    trigger OnDelete()
    begin
        DeleteOrder()
    end;

    trigger OnRename()
    begin

    end;

    local procedure GetWebSalesOrderNos()
    begin
        if Rec."Order No. for Sales" = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Webshop Order for Sales Nos.");
            Rec."Order No. for Sales" := NoSeriesMgt.GetNextNo(SalesSetup."Webshop Order for Sales Nos.");
        end;
    end;

    local procedure GetWebOrderNos()
    var
    begin
        if "Order No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Webshop Order Nos.");
            "Order No." := NoSeriesMgt.GetNextNo(SalesSetup."Webshop Order Nos.");
        end;
    end;

    local procedure GetCommentValue()
    begin
        if Rec.Comment <> '' then
            Rec."Comment Available" := true
        else
            Rec."Comment Available" := false;
    end;

    procedure CheckStatus()
    var
        OrderLine: Record "Webshop Order Line";
    begin
        if Rec.Status = Rec.Status::"Order Completed" then begin
            OrderLine.Reset();
            OrderLine.SetRange("Order No.", Rec."Order No.");
            OrderLine.SetRange(Quantity, 0);
            if OrderLine.FindFirst then
                repeat
                    if OrderLine.Quantity = 0 then
                        Error(Text003);
                until OrderLIne.Next() = 0;
            if not Confirm(Text001, false) then begin
                Rec.Status := xRec.Status;
            end;
        end;
    end;

    local procedure CheckOrderHeader()
    var
        IsChanged: Boolean;
    begin
        if Rec.Status = Rec.Status::"Order Completed" then begin
            if Rec."Customer No." <> xRec."Customer No." then begin
                Rec.Status := Rec.Status::"in Process";
                Rec.Modify();
                IsChanged := true;
            end;
            if Rec.Customer <> xRec.Customer then begin
                Rec.Status := Rec.Status::"in Process";
                Rec.Modify();
                IsChanged := true;
            end;
            if Rec.Address <> xRec.Address then begin
                Rec.Status := Rec.Status::"in Process";
                Rec.Modify();
                IsChanged := true;
            end;
        end;

        if IsChanged = true then
            Message(Text002);
    end;

    local procedure DeleteOrder()
    var
    begin
        if Rec.Status <> Rec.Status::"Order Completed" then
            exit
        else begin
            Rec.SetRange(Status, Rec.Status::"Order Completed");
            Rec.SetRange("Sales Order Created", true);
            DeleteAll();
        end;
    end;



    var
        NoSeriesMgt: Codeunit "No. Series";
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Record "No. Series";
        Text001: Label 'Did you check that the Information in Order are correct?';
        Text002: Label 'You´ve changed the Order the Order Status is now "In Process".';
        Text003: Label 'You can´t complete the Order because one line is missing quantity';
}