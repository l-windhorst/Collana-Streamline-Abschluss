table 50102 "Webshop Archive Header"
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
        }
        field(3; "Customer"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Address; Text[100])
        {
            DataClassification = ToBeClassified;
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
        }
        field(20; "Order No. for Sales"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Comment Available"; Boolean)
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