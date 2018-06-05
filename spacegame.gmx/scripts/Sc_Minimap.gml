var _x, _y, _s;
//_x = argument0; // top left
_y = argument1;
_s = room_width/view_wview[0]*5;
_x = argument0 + view_wview[0] - 1 - room_width/_s;  // top right

draw_set_color(c_gray); //c_black
draw_set_alpha(0.9);
draw_rectangle(_x,_y,_x+room_width/_s,_y+room_height/_s,false);
//draw_rectangle(_x1-room_width/_s,_y,_x1,_y+room_height/_s,0);
draw_set_alpha(0.9);
draw_set_color(c_white);
draw_rectangle(_x,_y,_x+room_width/_s,_y+room_height/_s,true);
//draw_rectangle(_x1-room_width/_s,_y,_x1,_y+room_height/_s,1);
draw_set_alpha(0.9);

draw_set_alpha(1);
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
with (O_Planet_Parent)
{
    draw_set_color(c_ltgray);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
/*
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
with (O_Tutorial_Target)
{
    draw_set_color(c_fuchsia);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_width/2)/_s, 0);
}
with (O_Ship)
{
    draw_set_color(c_orange);
    //draw_circle(_x+x/_s, _y+y/_s, (sprite_height/2)/_s, 0);
    draw_circle(_x+x/_s, _y+y/_s, (sprite_get_height(Sp_ShipV2)/2)/_s, 0);
}
if (global.debug)
{
    draw_set_color(c_red);
    draw_set_halign(fa_left);
    draw_set_valign(fa_left);
    //draw_text(_x+room_width/_s+10,_y+10, 
    draw_text(view_xview[0],view_yview[0], 
        "Smelting: " + string(O_Controller.smelting) +
        "#Time: " + string(O_Controller.processed_time/60) +
        "#Mouse X: " + string(mouse_x) + 
        "#Mouse Y: " + string(mouse_y) +
        "#FPS: " + string(fps) +
        "#Score: " + string(score) +
        "#Upgrade: " + string(global.ship_upgrade)
        );
}*/
