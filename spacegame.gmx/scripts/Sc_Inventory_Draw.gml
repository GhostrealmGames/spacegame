// argument0 is the controller
draw_sprite(Sp_Inv_Background,0,
    room_width/2,
    room_height/2);
draw_set_color(c_black);
draw_line_width(
    O_Menu_Inventory.final_x,
    room_height/2 - (sprite_get_height(Sp_Inv_Background)/2),
    O_Menu_Inventory.final_x,
    room_height/2 + sprite_get_height(Sp_Inv_Background)/2,
    2);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_yellow);
draw_text(O_Menu_Inventory.smelt_center, room_height/2 + sprite_get_height(Sp_Inv_Background)/2 - 16, string(O_Menu_Inventory.craft_page) + "/" + string(O_Menu_Inventory.craft_total));
// Bars
_x = 88;
_y = room_height;
// Healthbar
draw_set_color(c_health);
if (global.ship_health > 0)
{
    draw_rectangle(_x, _y - 157, _x + 280/100*global.ship_health, _y - 124, false);
}
// Fuel
draw_set_color(c_fuel);
if (global.fuel > 0)
{
    draw_rectangle(_x, _y - 107, _x + 280/100*global.fuel, _y - 70, false);
}
// Furnace
draw_set_color(c_furnace);
if (room == R_Menu_Inventory)
{
    if (O_Controller.processed_time > 0)
    {
        percent_complete = ((O_Controller.processed_time/room_speed)/(global.smelt_time[O_Controller.in_type]))*100;
        draw_rectangle(_x, _y - 54, _x + 280/100*percent_complete, _y - 18, false);
    }
}
else
{
    if (O_Tutorial.processed_time > 0)
    {
        percent_complete = ((O_Tutorial.processed_time/room_speed)/(global.smelt_time[O_Tutorial.in_type]))*100;
        draw_rectangle(_x, _y - 54, _x + 280/100*percent_complete, _y - 18, false);
    }
}
// Draw HUD Sprite
draw_sprite(Sp_HUD, 0, 0, _y);
