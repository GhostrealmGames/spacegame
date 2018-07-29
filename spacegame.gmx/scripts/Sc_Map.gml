var _x, _y, _s, _w, _h;
if(instance_exists(O_Main))
{
    width = O_Main.map_size;
    height = O_Main.map_size;
}
else if(instance_exists(O_Tutorial_Main))
{
    width = O_Tutorial_Main.map_size;
    height = O_Tutorial_Main.map_size;
}
else
{
    width = 20000;
    height = 20000;
}
_x = argument0// + view_wview[0]/2;
_y = argument1// + view_hview[0]/2;
_s = width/view_wview[0] * 2;
_w = width/_s;
_h = height/_s;

//_x = argument0 - O_Ship.x/_s + view_wview[0]/2;
//_y = argument1 - O_Ship.y/_s + view_hview[0]/2;
_x = argument0 - width/2/_s + view_wview[0]/2;
_y = argument1 - height/2/_s + view_hview[0]/2;

draw_set_alpha(.5);
draw_set_color(c_ltgray);
draw_rectangle(_x, _y, _x + width/_s, _y + width/_s, false);
draw_set_color(c_white);
draw_rectangle(_x, _y, _x + width/_s, _y + width/_s, true);

// Center on nearest Planet
if(instance_exists(O_Ship))
{
    nearest = instance_nearest(O_Ship.x, O_Ship.y, O_Planet_Parent);
    if(instance_exists(nearest))
    {
        _x = _x - nearest.x / _s + width/2/_s;
        _y = _y - nearest.y / _s + height/2/_s;
    }
    else
    {
        // Center on player
        _x = _x - O_Ship.x / _s + width/2/_s;
        _y = _y - O_Ship.y / _s + height/2/_s;
    }
}
else
{
    nearest = instance_nearest(1920/2, 1080/2, O_Planet_Parent);
    if(instance_exists(nearest))
    {
        _x = _x - nearest.x / _s + width/2/_s;
        _y = _y - nearest.y / _s + height/2/_s;
    }
    else
    {
        // Center on player
        _x = _x - 1920/2 / _s + width/2/_s;
        _y = _y - 1080/2 / _s + height/2/_s;
    }
}

draw_set_alpha(.8);
// Tutorial Objects
with (O_Tutorial_Target)
{
    draw_set_color(c_fuchsia);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
with (O_Tutorial_Asteroid)
{
    draw_set_color(c_brown);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
// Main Objects
with (O_Asteroid)
{
    draw_set_color(c_brown);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
with (O_Comet)
{
    draw_set_color(c_aqua);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width)/_s, 0);
}
draw_set_alpha(.6);
with (O_Planet_Parent)
{
    draw_set_color(c_ltgray);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
with (O_Star_Parent)
{
    draw_set_color(c_orange);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
draw_set_alpha(.8);
with (O_Particle_Parent)
{
    draw_set_color(c_lime);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}

with (O_Droid_Parent)
{
    draw_set_color(c_fuchsia);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
with (O_EnemyBlueSimple)
{
    draw_set_color(c_red);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
with (O_Boss)
{
    draw_set_color(c_red);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
with (O_BossTop)
{
    draw_set_color(c_blue);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
with (O_BossBottom)
{
    draw_set_color(c_blue);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
with (O_Ship)
{
    draw_set_color(c_orange);
    //draw_circle(_x+x/_s, _y+y/_s, (sprite_height/2)/_s, 0);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_get_height(Sp_ShipV2)/2)/_s, 0);
}
if(global.debug)
{
    with (O_Trail)
    {
        draw_set_color(c_red);
        draw_circle(_x+x/_s, _y+y/_s, (sprite_get_height(Sp_Asteroid)/4)/_s, 0);
    }
}
