tableextension 50103 "Webshop Vendor Name" extends Item
{
    fields
    {
        field(50100; "Vendor Name"; Text[100])
        {
            DataClassification = CustomerContent;

        }
    }
    local procedure GetVendorName()
    var
        Vendor: Record Vendor;
    begin
        if Rec."Vendor No." <> xRec."Vendor No." then
            Vendor.Get(Rec."Vendor No.");
        Rec."Vendor Name" := Vendor.Name;
    end;

    trigger OnModify()
    begin
        GetVendorName();
    end;
}