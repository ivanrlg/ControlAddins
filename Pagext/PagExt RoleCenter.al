pageextension 57100 "My Business Manager RC" extends "Business Manager Role Center"
{
    layout
    {
        addbefore(Control139)
        {
            part(Pageusercontrol; Pageusercontrol)
            {
                ApplicationArea = All;
            }
        }
    }
}
