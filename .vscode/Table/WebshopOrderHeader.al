table 50100 "Webshop Order Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
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
            DataClassification = ToBeClassified;
        }
        field(7; City; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Post Code"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Country; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Contact; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "E-Mail"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Birthday; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Overall Amount"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Total Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Status"; Enum "Webshop Status Enum")
        {
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // begin
            //     CheckStatus()
            // end;
        }
        field(17; "Payment Method"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Comment"; Text[255])
        {
            DataClassification = ToBeClassified;

        }
        field(19; "Source Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Order No. for Sales"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Comment Available"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Contact Code"; Code[20])//Wenn contact ausgewählt Lookup
        {
            DataClassification = ToBeClassified;
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
    end;

    trigger OnDelete()
    begin

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
    begin
        if Rec.Status = Rec.Status::"Order Completed" then
            if not Confirm(Text001, false) then
                Rec.Status := xRec.Status;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Record "No. Series";
        Text001: Label 'Did you check that the Information in Order are correct?';
}