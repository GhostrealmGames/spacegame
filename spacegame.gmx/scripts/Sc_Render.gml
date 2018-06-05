instance_deactivate_object(O_Border);
//instance_deactivate_object(O_Asteroid_Parent);
with (O_Asteroid_Parent)
{
    instance_activate_region(x - sprite_width, y - sprite_height, 2*sprite_width, 2*sprite_height, true);
}
with (O_Ship)
{
    instance_activate_region(x - sprite_width, y - sprite_height, 2*sprite_width, 2*sprite_height, true);
}
