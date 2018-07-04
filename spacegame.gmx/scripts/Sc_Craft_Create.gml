var width, height, craft_num, prev_x, prev_y;
width = 6;
height = 6;
craft_num = 0;
prev_x = O_Menu_Inventory.final_x + sprite_get_width(Sp_Inv_Slot);
prev_y = room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + 2.5*sprite_get_width(Sp_Inv_Slot);
for(row = 0; row < height; row += 1)
{
    for(col = 0; col < width; col += 1)
    {
        if(col == 0 && row == 0)
        {
            global.Craft_Slots[craft_num] = instance_create(
                O_Menu_Inventory.final_x + sprite_get_width(Sp_Inv_Slot),
                room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + 2.5*sprite_get_width(Sp_Inv_Slot),
                O_Craft_Slot);
        }
        else if(col == 0)
        {
            global.Craft_Slots[craft_num] = instance_create(
                O_Menu_Inventory.final_x + sprite_get_width(Sp_Inv_Slot),
                prev_y + (sprite_get_height(Sp_Inv_Slot)*1.5),
                O_Craft_Slot);
        }
        else if(row == 0)
        {
            global.Craft_Slots[craft_num] = instance_create(
                prev_x + (sprite_get_width(Sp_Inv_Slot)*1.5),
                room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + 2.5*sprite_get_width(Sp_Inv_Slot),
                O_Craft_Slot);
        }
        else
        {
            global.Craft_Slots[craft_num] = instance_create(
                prev_x + (sprite_get_width(Sp_Inv_Slot)*1.5),
                prev_y + (sprite_get_height(Sp_Inv_Slot)*1.5),
                O_Craft_Slot);
        }
        prev_x = global.Craft_Slots[craft_num].x;
        global.Craft_Slots[craft_num].snum = craft_num;
        craft_num += 1;
        }
    prev_y = global.Craft_Slots[craft_num-1].y;
}
instance_create(
    prev_x,
    room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot),
    O_Inv_Trash);
