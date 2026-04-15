table 50102 "Webshop Archive Header"
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
            DataClassification = SystemMetadata;
        }
        field(3; "Customer"; Text[100])
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