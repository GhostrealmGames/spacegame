var slot_empty, filled_slots, total_slots;
slot_empty = true;
filled_slots = 0;
total_slots = 49;
for (u = 0; u < 2*total_resource_types + craftable_items; u += 1)
{
    global.Inv_Draw[u] = global.Inventory[u];
} 
for (slot = 0; slot < total_slots; slot += 1)
{
    for (i = 0; i < 2*total_resource_types + craftable_items; i += 1)
    {
        if(slot_empty)
        {
            if (global.Inv_Draw[i] > 0)
            {
                if (global.Inv_Draw[i] >= stack_size)
                {
                    global.Slots[slot].num_resources = stack_size;
                    global.Slots[slot].resource_type = i;
                    global.Inv_Draw[i] -= stack_size;
                    slot_empty = false;
                }
                else
                {
                    global.Slots[slot].num_resources = global.Inv_Draw[i];
                    global.Slots[slot].resource_type = i;
                    global.Inv_Draw[i] = 0;
                    slot_empty = false;
                }
                filled_slots += 1;
            }
        }
    }
    if (slot_empty == true)
    {
        global.Slots[slot].num_resources = 0;
        global.Slots[slot].resource_type = -1;
    }
    slot_empty = true;
}
if (room == R_Menu_Inventory)
{
    if (filled_slots >= total_slots)
    {
        O_Controller.inv_slots_full = true;
    }
    else
    {
        O_Controller.inv_slots_full = false;
    }
    if (O_Controller.inv_slots_full)
    {
        for (i = 0; i < 2*total_resource_types + craftable_items; i += 1)
        {
            if ((global.Inventory[i] mod stack_size) <= 0)
            {
                O_Controller.inv_full[i] = true;
            }
        }
    }
    else
    {
        for (i = 0; i < 2*total_resource_types + craftable_items; i += 1)
        {
            O_Controller.inv_full[i] = false;
        }
    }
}
else
{
    if (filled_slots >= total_slots)
    {
        O_Tutorial.inv_slots_full = true;
    }
    else
    {
        O_Tutorial.inv_slots_full = false;
    }
    if (O_Tutorial.inv_slots_full)
    {
        for (i = 0; i < 2*total_resource_types + craftable_items; i += 1)
        {
            if ((global.Inventory[i] mod stack_size) <= 0)
            {
                O_Tutorial.inv_full[i] = true;
            }
        }
    }
    else
    {
        for (i = 0; i < 2*total_resource_types + craftable_items; i += 1)
        {
            O_Tutorial.inv_full[i] = false;
        }
    }
}
return filled_slots;
