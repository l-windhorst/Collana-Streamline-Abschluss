table 50104 "Webshop Order Discount"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Discount Code No."; Code[20]) //Reine Nummernserie Inten
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Discount Code"; Code[20])//Lookup für anzeige
        {
            DataClassification = ToBeClassified;
        }
        field(3; Discount; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Discount Code No.")
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

    local procedure GetNextDiscountNos()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";

    begin
        if Rec."Discount Code No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Discount Nos.");
            "Discount Code No." := NoSeriesMgt.GetNextNo(SalesSetup."Discount Nos.");
        end;

    end;

    trigger OnInsert()
    begin
        GetNextDiscountNos();
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}