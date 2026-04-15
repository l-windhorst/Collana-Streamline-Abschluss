table 50103 "Webshop Archive Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            DataClassification = SystemMetadata;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(3; "Item Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Item Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Unit Price"; Decimal)
        {
            DataClassification = SystemMetadata;
        }
        field(6; Quantity; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(7; "In Stock"; Boolean)
        {
            DataClassification = SystemMetadata;
        }
        field(8; Vendor; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(9; Price; Decimal)
        {
            DataClassification = SystemMetadata;
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
        }
        field(14; "Total Price"; Decimal)
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
}