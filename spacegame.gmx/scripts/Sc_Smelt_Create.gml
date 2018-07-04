var input, output;
smelt_center = O_Menu_Inventory.final_x + ((room_width/2 + sprite_get_width(Sp_Inv_Background)/2) - O_Menu_Inventory.final_x)/2;
if (room == R_Menu_Inventory)
{
input = instance_create(
    smelt_center - 1.5*sprite_get_width(Sp_Inv_Slot),
    room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + sprite_get_height(Sp_Inv_Slot),
    O_Smelt_Input);
output = instance_create(
    input.x + 3*sprite_get_width(Sp_Inv_Slot),
    input.y,
    O_Smelt_Output);
}
else
{
input = instance_create(
    smelt_center - 1.5*sprite_get_width(Sp_Inv_Slot),
    room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + sprite_get_height(Sp_Inv_Slot),
    O_Tutorial_Input);
output = instance_create(
    input.x + 3*sprite_get_width(Sp_Inv_Slot),
    input.y,
    O_Tutorial_Output);
}
return smelt_center;
