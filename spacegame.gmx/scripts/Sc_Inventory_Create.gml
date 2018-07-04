var width, height, slot_num, prev_x, prev_y;
width = 7;
height = 7;
slot_num = 0;
prev_x = room_width/2 - (sprite_get_width(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot);
prev_y = room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot);
if (room == R_Menu_Inventory)
{
    for(row = 0; row < height; row += 1)
    {
        for(col = 0; col < width; col += 1)
        {
            if(col == 0 && row == 0)
            {
                global.Slots[slot_num] = instance_create(
                    room_width/2 - (sprite_get_width(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot),
                    room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot),
                    O_Inv_Slot);
            }
            else if(col == 0)
            {
                global.Slots[slot_num] = instance_create(
                    room_width/2 - (sprite_get_width(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot),
                    prev_y + (sprite_get_height(Sp_Inv_Slot)*1.5),
                    O_Inv_Slot);
            }
            else if(row == 0)
            {
                global.Slots[slot_num] = instance_create(
                    prev_x + (sprite_get_width(Sp_Inv_Slot)*1.5),
                    room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot),
                    O_Inv_Slot);
            }
            else
            {
                global.Slots[slot_num] = instance_create(
                    prev_x + (sprite_get_width(Sp_Inv_Slot)*1.5),
                    prev_y + (sprite_get_height(Sp_Inv_Slot)*1.5),
                    O_Inv_Slot);
            }
            prev_x = global.Slots[slot_num].x;
            global.Slots[slot_num].snum = slot_num;
            slot_num += 1;
        }
        prev_y = global.Slots[slot_num-1].y;
    }
    }
    else
    {
    for(row = 0; row < height; row += 1)
    {
        for(col = 0; col < width; col += 1)
        {
            if(col == 0 && row == 0)
            {
                global.Slots[slot_num] = instance_create(
                    room_width/2 - (sprite_get_width(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot),
                    room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot),
                    O_Tutorial_Slot);
            }
            else if(col == 0)
            {
                global.Slots[slot_num] = instance_create(
                    room_width/2 - (sprite_get_width(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot),
                    prev_y + (sprite_get_height(Sp_Inv_Slot)*1.5),
                    O_Tutorial_Slot);
            }
            else if(row == 0)
            {
                global.Slots[slot_num] = instance_create(
                    prev_x + (sprite_get_width(Sp_Inv_Slot)*1.5),
                    room_height/2 - (sprite_get_height(Sp_Inv_Background)/2) + sprite_get_width(Sp_Inv_Slot),
                    O_Tutorial_Slot);
            }
            else
            {
                global.Slots[slot_num] = instance_create(
                    prev_x + (sprite_get_width(Sp_Inv_Slot)*1.5),
                    prev_y + (sprite_get_height(Sp_Inv_Slot)*1.5),
                    O_Tutorial_Slot);
            }
            prev_x = global.Slots[slot_num].x;
            global.Slots[slot_num].snum = slot_num;
            slot_num += 1;
        }
        prev_y = global.Slots[slot_num-1].y;
    }
}
final_x = prev_x + sprite_get_width(Sp_Inv_Slot);
return final_x;
