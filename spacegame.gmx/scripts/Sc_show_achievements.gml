var i, name, num_achievements;
_x = argument0;
_y = argument1;
draw_set_halign(fa_left);
draw_set_valign(fa_top);

num_achievements = gms_achievement_count();
draw_set_color(c_gray);
draw_rectangle(_x-15, _y-15, _x + 275, _y + num_achievements*15 + 15, false);
for(i = 0; i < num_achievements; i += 1)
{
    name = gms_achievement_find(i);
    if(gms_achievement_isreached(name))
    {
        draw_set_color(c_lime);
    }
    else
    {
        draw_set_color(c_red);
    }
    draw_text(_x, _y + (i*15), gms_achievement_description(name));
}