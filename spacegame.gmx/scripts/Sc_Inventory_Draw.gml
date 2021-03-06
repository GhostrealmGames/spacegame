// argument0 is the controller
background_w = 1312;
background_h = 704;
slot_w = sprite_get_width(Sp_Inv_Slot);
slot_h = sprite_get_height(Sp_Inv_Slot);
controller = global.controller;

// Draw Background
draw_set_alpha(0.5);
draw_set_color(make_color_rgb(192, 192, 192));
draw_rectangle(room_width/2 - 656, room_height/2 - 352, room_width/2 + 656, room_height/2 + 352, false);
draw_set_alpha(1);

// Draw Dividing Line
draw_set_color(c_black);
draw_line_width(
    O_Menu_Inventory.final_x,
    room_height/2 - (background_h/2),
    O_Menu_Inventory.final_x,
    room_height/2 + background_h/2,
    2);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_yellow);
draw_text(O_Menu_Inventory.smelt_center, room_height/2 + background_h/2 - 16, string(O_Menu_Inventory.craft_page) + "/" + string(O_Menu_Inventory.craft_total));
// Bars
_x = 88;
_y = room_height;
// Healthbar
draw_set_color(c_health);
draw_set_alpha(0.5);
if (controller.health_add > 0)
{
    draw_rectangle(_x, _y - 157, _x + 280/100*controller.health_add, _y - 124, false);
}
draw_set_alpha(1);
if (controller.ship_health > 0)
{
    draw_rectangle(_x, _y - 157, _x + 280/100*controller.ship_health, _y - 124, false);
}
// Fuel
draw_set_color(c_fuel);
draw_set_alpha(0.5);
if (controller.fuel_add > 0)
{
    draw_rectangle(_x, _y - 104, _x + 280/100*controller.fuel_add, _y - 70, false);
}
draw_set_alpha(1);
if (controller.fuel > 0)
{
    draw_rectangle(_x, _y - 107, _x + 280/100*controller.fuel, _y - 70, false);
}
// Furnace
draw_set_color(c_furnace);
if (controller.processed_time > 0)
{
    percent_complete = ((controller.processed_time/room_speed)/(global.smelt_time[controller.in_type]))*100;
    draw_rectangle(_x, _y - 54, _x + 280/100*percent_complete, _y - 18, false);
}
// Draw HUD Sprite
draw_sprite(Sp_HUD, 0, 0, _y);
