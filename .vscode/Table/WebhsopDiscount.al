table 50104 "Webshop Order Discount"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Discount Code No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Discount Code"; Code[20])
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

    trigger OnInsert()
    begin

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