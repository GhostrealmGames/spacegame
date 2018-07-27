var i;
total_slots = 49;
empty_slots = 0;
for(i = 0; i < total_slots; i+=1)
{
    if(global.Slots[i].num_resources <= 0)
    {
        empty_slots += 1;
    }
}
available_space = 0;
item_type = argument0;
max_stack = stack_size;
if(item_type >= 0)
{
    available_space = max_stack*empty_slots + (max_stack - (global.Inventory[item_type] mod max_stack));
}
return available_space;
