var input, output;
background_w = 1312;
background_h = 704;
slot_w = sprite_get_width(Sp_Inv_Slot);
slot_h = sprite_get_height(Sp_Inv_Slot);
smelt_center = O_Menu_Inventory.final_x + ((room_width/2 + background_w/2) - O_Menu_Inventory.final_x)/2;
if (room == R_Menu_Inventory)
{
input = instance_create(
    smelt_center - 1.5*slot_w,
    room_height/2 - (background_h/2) + slot_h,
    O_Smelt_Input);
output = instance_create(
    input.x + 3*slot_w,
    input.y,
    O_Smelt_Output);
}
else
{
input = instance_create(
    smelt_center - 1.5*slot_w,
    room_height/2 - (background_h/2) + slot_h,
    O_Tutorial_Input);
output = instance_create(
    input.x + 3*slot_w,
    input.y,
    O_Tutorial_Output);
}
return smelt_center;
