tableextension 50102 "Webshop Order Nos." extends "Sales & Receivables Setup" //Debitoren und Verkaufseinrichtung
{
    fields
    {
        field(50100; "Discount Nos."; Code[20])
        {
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
        field(50101; "Webshop Order Nos."; Code[20])
        {
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
        field(50102; "Webshop Order for Sales Nos."; Code[20])
        {
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
    }


    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}