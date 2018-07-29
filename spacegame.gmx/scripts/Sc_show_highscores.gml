var i, name, num_achievements;
bar_width = argument2;
bar_height = argument3;
padding = argument4;
spacing = argument5;
object_id = argument6;
header_height = 100;
_x = argument0 - bar_width/2 + padding;
_hy = argument1 + spacing;
_y = _hy + header_height + spacing;

/*if(instance_exists(O_Title_Highscores))
{
    num_highscores = O_Title_Highscores.num_highscores;
    if(num_highscores > 0)
    {
        scroll = O_Title_Highscores.scroll;
        list_id = O_Title_Highscores.list_id;
    }
}
else if(instance_exists(O_Explosion))
{
    num_highscores = O_Explosion.num_highscores;
    if(num_highscores > 0)
    {
        scroll = O_Explosion.scroll;
        list_id = O_Explosion.list_id;
    }
}*/
if(instance_exists(object_id))
{
    num_highscores = object_id.num_highscores;
    if(num_highscores > 0)
    {
        scroll = object_id.scroll;
        list_id = object_id.list_id;
    }
}
else
{
    if(gms_highscore_list_count() > 0)
    {
        list_id = gms_highscore_list_id(0);
        num_highscores = gms_highscore_count(list_id);
    }
    else
    {
        num_highscores = 0;
    }
    scroll = 0;
}

// Black out background
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, room_width,  room_height, false);
draw_set_alpha(1);

// Draw Highscores
if(num_highscores > 0)
{
    draw_set_font(fnt_achievements);
    for(i = 0; i < num_highscores; i += 1)
    {
        draw_set_halign(fa_left);
        draw_set_valign(fa_center);
        name = gms_highscore_name(list_id, i);
        player_score = gms_highscore_score(list_id, i);
        
        // Draw background box
        // Set Background color
        if(gms_self_name() == name) {
            draw_set_color(c_green);
        } else {
            draw_set_color(c_gray);
        }
        draw_rectangle(_x - padding, _y + (i*bar_height) + (i*spacing) + scroll, _x + bar_width + padding, _y + ((i+1)*bar_height + i*spacing) + scroll, false);
        
        // Set Player Name Text color
        if(gms_self_name() == name) {
            draw_set_color(c_black);
        } else {
            draw_set_color(c_black);
        }
        
        // Draw Player Name and position in list
        draw_text(_x, _y + (i*bar_height) + (i*spacing) + bar_height/2 + scroll, string(i + 1) + ". " + name);
        
        // Draw Player Score
        draw_set_color(c_black);
        draw_set_halign(fa_right);
        draw_text(_x + bar_width, _y + (i*bar_height) + (i*spacing) + bar_height/2 + scroll, player_score);
    }
}
else
{
    draw_set_font(fnt_achievements);
    draw_set_halign(fa_left);
    draw_set_valign(fa_center);
    
    // Set Background color
    draw_set_color(c_gray);
    // Draw background box
    draw_rectangle(_x - padding, _y /*+ (i*bar_height) + (i*spacing)*/ + scroll, _x + bar_width + padding, _y + bar_height + scroll, false);
    
    // Set Player Name Text color
    draw_set_color(c_black);
    // Draw Player Name and position in list
    draw_text(_x, _y /*+ (i*bar_height) + (i*spacing)*/ + bar_height/2 + scroll, "No Highscores");
}
// Draw List Header
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_font(fnt_update);
draw_set_color(c_gray);
draw_rectangle(_x - padding, _hy, _x + bar_width + padding, _hy + header_height, false);
draw_set_color(c_black);
draw_text(_x + bar_width/2, _hy + header_height/2, "Highscore List");
