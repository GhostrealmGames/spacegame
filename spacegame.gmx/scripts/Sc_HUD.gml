var _x, _y, _x2, _x3, percent_complete, speed_percent;
// Minimap
if (argument2.draw_map)
{
    Sc_Map(argument0, argument1);
}
else
{
    Sc_Minimap_experimental(argument0, argument1);
}
draw_set_valign(fa_center);
draw_set_halign(fa_left);
// Draw Bars
draw_set_alpha(1);
if (instance_exists(O_Ship))
{
    _x = view_xview[0] + 88;
    _y = view_yview[0] + view_hview[0];
    // Speed
    if (global.debug)
    {
    draw_set_color(c_blue);
    if (O_Ship.speed > 0)
    {
        speed_percent = (O_Ship.speed/O_Ship.max_speed)*100;
        draw_rectangle(_x, _y - 204, _x + 280/100*speed_percent, _y - 174, false);
    }
    else
    {
        speed_percent = 0;
    }
    }
    // Healbar
    draw_set_color(c_health);
    if (global.ship_health > 0)
    {
        draw_rectangle(_x, _y - 154, _x + 280/100*global.ship_health, _y - 124, false);
    }
    // Fuel
    draw_set_color(c_fuel);
    if (global.fuel > 0)
    {
        draw_rectangle(_x, _y - 104, _x + 280/100*global.fuel, _y - 70, false);
    }
    // Furnace
    draw_set_color(c_furnace);
    if (instance_exists(O_Controller))
    {
    if (O_Controller.processed_time > 0)
    {
        percent_complete = ((O_Controller.processed_time/room_speed)/(global.smelt_time[O_Controller.in_type]))*100;
        draw_rectangle(_x, _y - 54, _x + 280/100*percent_complete, _y - 18, false);
    }
    }
    else
    {
    /*if (O_Tutorial.processed_time > 0)
    {
        percent_complete = ((O_Tutorial.processed_time/room_speed)/(global.smelt_time[O_Tutorial.in_type]))*100;
        draw_rectangle(_x, _y - 54, _x + 280/100*percent_complete, _y - 18, false);
    }*/
    }
    // Draw HUD Sprite
    draw_sprite(Sp_HUD, 0, view_xview[0], view_yview[0] + view_hview[0]);
    // Draw Speed
    if (global.debug)
    {
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        draw_text(view_xview[0] + view_wview[0] - 10, view_yview[0] + view_hview[0] - 10,
            "Ship Speed: " + string(O_Ship.speed) +
            "#Max Speed: " + string(O_Ship.max_speed) +
            "#Speed Percent: " + string(speed_percent)
            );
    }
}
