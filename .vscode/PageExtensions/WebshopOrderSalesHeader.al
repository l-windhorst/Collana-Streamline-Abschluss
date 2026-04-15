// pageextension 50103 "Webshop Order Sales Header" extends "Sales Order"
// {
//     layout
//     {
//         addfirst(General)
//         {
//             field("Webshop Order Source"; Rec."Webshop Order Source")
//             {
//                 ToolTip = 'Specifies the value of the Webshop Order Source field.', Comment = '%';
//                 ApplicationArea = All;
//             }
//         }
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;
// }