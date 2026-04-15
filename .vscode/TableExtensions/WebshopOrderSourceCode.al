tableextension 50104 "Webshop Order Source Code" extends "Source Code Setup"
{
    fields
    {
        field(50104; "Webshop Order Order No."; Code[20])
        {
            DataClassification = SystemMetadata;
            TableRelation = "Source Code";
            //Code um festzustellen ob dieser Verkaufsauftrag aus dem Webshop kommt
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