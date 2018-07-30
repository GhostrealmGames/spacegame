var width, height, craft_num, prev_x, prev_y;
background_w = 1312;
background_h = 704;
slot_w = sprite_get_width(Sp_Inv_Slot);
slot_h = sprite_get_height(Sp_Inv_Slot);
width = 6;
height = 6;
craft_num = 0;
prev_x = O_Menu_Inventory.final_x + slot_w;
prev_y = room_height/2 - (background_h/2) + 2.5*slot_h;
for(row = 0; row < height; row += 1)
{
    for(col = 0; col < width; col += 1)
    {
        if(col == 0 && row == 0)
        {
            global.Craft_Slots[craft_num] = instance_create(
                O_Menu_Inventory.final_x + slot_w,
                room_height/2 - (background_h/2) + 2.5*slot_h,
                O_Craft_Slot);
        }
        else if(col == 0)
        {
            global.Craft_Slots[craft_num] = instance_create(
                O_Menu_Inventory.final_x + slot_w,
                prev_y + (slot_h*1.5),
                O_Craft_Slot);
        }
        else if(row == 0)
        {
            global.Craft_Slots[craft_num] = instance_create(
                prev_x + (slot_w*1.5),
                room_height/2 - (background_h/2) + 2.5*slot_h,
                O_Craft_Slot);
        }
        else
        {
            global.Craft_Slots[craft_num] = instance_create(
                prev_x + (slot_w*1.5),
                prev_y + (slot_h*1.5),
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
    room_height/2 - (background_h/2) + slot_h,
    O_Inv_Trash);
