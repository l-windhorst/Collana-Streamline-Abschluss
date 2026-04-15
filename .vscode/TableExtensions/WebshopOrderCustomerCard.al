tableextension 50100 "Webshop Customer Card" extends "Customer"
{
    fields
    {
        field(50100; "Birthday"; Date)
        {
            DataClassification = CustomerContent;
        }
    }
}