table 50104 "Webshop Order Discount"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Discount Code No."; Code[20]) //Reine Nummernserie Inten
        {
            DataClassification = CustomerContent;
        }
        field(2; "Discount Code"; Code[20])//Lookup für anzeige
        {
            DataClassification = CustomerContent;
        }
        field(3; Discount; Integer)
        {
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Discount Code No.")
        {
            Clustered = true;
        }
    }
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
}