table 50103 "Webshop Archive Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Item Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Item Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "In Stock"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Vendor; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Price; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Discount Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Discount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Price After Discount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Total Price"; Decimal)
        {
            DataClassification = ToBeClassified;
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