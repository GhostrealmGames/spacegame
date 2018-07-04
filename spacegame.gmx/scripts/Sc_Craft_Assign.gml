var craft_empty, craft_draw;
craft_empty = true;
for (u = 0; u < 36; u += 1)
{
    if (u < craftable_items)
    {
        craft_draw[u] = 1; // 1, true = not drawn; 0, false = drawn
    }
    else
    {
        craft_draw[u] = 0;
    }
}
for (craft_slot = 0; craft_slot < 36; craft_slot += 1)
{
    for (item = 0; item < craftable_items; item += 1)
    {
        if(craft_empty)
        {
            if (craft_draw[item] == 1)
            {
                global.Craft_Slots[craft_slot].craft_type = item;
                global.Craft_Slots[craft_slot].craft_num = 1;
                craft_empty = false;
                craft_draw[item] = 0;
                if (global.Craft_Slots[craft_slot].craft_type == copper_wire)
                {
                    global.Craft_Slots[craft_slot].craft_num = 2;
                }
                else if (global.Craft_Slots[craft_slot].craft_type == gold_wire)
                {
                    global.Craft_Slots[craft_slot].craft_num = 2;
                }
                else
                {
                    global.Craft_Slots[craft_slot].craft_num = 1;
                }
            }
            else
            {
                global.Craft_Slots[craft_slot].craft_type = -1;
                global.Craft_Slots[craft_slot].craft_num = 0;
            }
        }
    }
    craft_empty = true;
}
