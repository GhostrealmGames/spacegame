var _x, _y, _s, _w, _h, _x1, _y1;
//_x = argument0; // top left
width = 4000;
height = 4000;
_y1 = argument1;
_s = width/view_wview[0] * 5// * 5;
_w = 400//room_width/_s;
_h = 400//room_height/_s;
_x1 = argument0 + view_wview[0] - 1 - _w;  // top right

draw_set_color(c_gray);
draw_set_alpha(0.9);
draw_rectangle(_x1, _y1, _x1 + _w, _y1 + _h, false);
draw_set_alpha(0.9);
draw_set_color(c_white);
draw_rectangle(_x1, _y1, _x1 + _w, _y1 + _h, true);
draw_set_alpha(0.9);

if (room == R_Tutorial)
{
    _s *= 1;
}
else
{
    _s *= 1/3;
}
if (instance_exists(O_Ship))
{
    _x = (argument0 + view_wview[0] - 1 - _w) - O_Ship.x/_s + _w/2;
    _y = argument1 - O_Ship.y/_s + _h/2;
}
else
{
    _x = (argument0 + view_wview[0] - 1 - _w) + _w/2;
    _y = argument0 + _h/2;
}

draw_set_alpha(1);
// Tutorial Objects
/*
with (O_Tutorial_Target)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_fuchsia);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}
with (O_Tutorial_Asteroid)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_brown);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}*/
// Main Objects
with (O_Asteroid)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_brown);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}
/*with (O_Comet)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_aqua);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}*/
with (O_Planet_Parent)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_ltgray);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}
/*
with (O_Particle_Parent)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_lime);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}
with (O_Droid_Parent)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_fuchsia);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}
with (O_EnemyBlueSimple)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_red);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}
with (O_Boss)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_red);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}
with (O_BossTop)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_blue);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}
with (O_BossBottom)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_blue);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
    }
}
*/
with (O_Ship)
{
    if (_x1 < (_x+x/_s) && _y1 < (_y+y/_s) && _x1+_w > (_x+x/_s) && _y1+_h > (_y+y/_s))
    {
        draw_set_color(c_orange);
        //draw_circle(_x+x/_s, _y+y/_s, (sprite_height/2)/_s, 0);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_get_height(Sp_ShipV2)/2)/_s, 0);
    }
}
if (global.debug)
{
    draw_set_color(c_red);
    draw_set_halign(fa_left);
    draw_set_valign(fa_left);
    //draw_text(_x+room_width/_s+10,_y+10, 
    draw_text(view_xview[0],view_yview[0], 
        //"Smelting: " + string(O_Controller.smelting) +
        //"#Time: " + string(O_Controller.processed_time/60) +
        "#Mouse X: " + string(mouse_x) + 
        "#Mouse Y: " + string(mouse_y) +
        "#FPS: " + string(fps) +
        "#Score: " + string(score) +
        "#Upgrade: " + string(global.ship_upgrade) +
        "#_x1: " + string(_x1)
        );
}
