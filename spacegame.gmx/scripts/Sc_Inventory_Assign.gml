var slot_empty, filled_slots, total_slots;
slot_empty = true;
filled_slots = 0;
total_slots = 49;
controller = global.controller;
for (u = 0; u < 2*total_resource_types + craftable_items; u += 1)
{
    controller.Inv_Draw[u] = controller.Inventory[u];
} 
for (slot = 0; slot < total_slots; slot += 1)
{
    for (i = 0; i < 2*total_resource_types + craftable_items; i += 1)
    {
        if(slot_empty)
        {
            if (controller.Inv_Draw[i] > 0)
            {
                if (controller.Inv_Draw[i] >= stack_size)
                {
                    controller.Slots[slot].num_resources = stack_size;
                    controller.Slots[slot].resource_type = i;
                    controller.Inv_Draw[i] -= stack_size;
                    slot_empty = false;
                }
                else
                {
                    controller.Slots[slot].num_resources = controller.Inv_Draw[i];
                    controller.Slots[slot].resource_type = i;
                    controller.Inv_Draw[i] = 0;
                    slot_empty = false;
                }
                filled_slots += 1;
            }
        }
    }
    if (slot_empty == true)
    {
        controller.Slots[slot].num_resources = 0;
        controller.Slots[slot].resource_type = -1;
    }
    slot_empty = true;
}
if (filled_slots >= total_slots)
{
    controller.inv_slots_full = true;
}
else
{
    controller.inv_slots_full = false;
}
if (controller.inv_slots_full)
{
    for (i = 0; i < 2*total_resource_types + craftable_items; i += 1)
    {
        if ((controller.Inventory[i] mod stack_size) <= 0)
        {
            controller.inv_full[i] = true;
        }
    }
}
else
{
    for (i = 0; i < 2*total_resource_types + craftable_items; i += 1)
    {
        controller.inv_full[i] = false;
    }
}
return filled_slots;
