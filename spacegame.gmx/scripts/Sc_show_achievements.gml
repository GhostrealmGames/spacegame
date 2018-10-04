var i, name, num_achievements;
bar_height = argument3;
bar_width = argument2;
padding = argument4;
spacing = argument5;
_x = argument0 - bar_width/2 + padding;
_hy = argument1 + spacing;
_y = _hy + bar_height + spacing;

if(instance_exists(O_Title_Achievements))
{
    scroll = O_Title_Achievements.scroll;
    num_achievements = O_Title_Achievements.num_achievements;
}
else
{
    num_achievements = gms_achievement_count();
    scroll = 0;
}

// Black out background
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, room_width,  room_height, false);
draw_set_alpha(1);

// Draw Achievements
draw_set_font(fnt_achievements);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
for(i = 0; i < num_achievements; i += 1)
{
    name = gms_achievement_find(i);
    
    // Set Background Completion color
    if(gms_achievement_isreached(name)) {
        draw_set_color(c_green);
    } else {
        draw_set_color(c_gray);
    }
    // Draw background box
    draw_rectangle(_x - padding, _y + (i*bar_height) + (i*spacing) + scroll, _x + bar_width + padding, _y + ((i+1)*bar_height + i*spacing) + scroll, false);
    
    // Set Text Completion color
    if(gms_achievement_isreached(name)) {
        draw_set_color(c_black);
    } else {
        draw_set_color(c_black);
    }
    
    // Draw Achievement description
    draw_text(_x, _y + (i*bar_height) + (i*spacing) + padding + scroll, gms_achievement_description(name));
    
    // Draw progress
    total = string_digits(Sc_String_Decipher(2, '_', name));
    if(total != "")
    {
        // Draw Progress Bar background
        draw_set_color(c_black);
        draw_rectangle(_x, _y + (i*bar_height) + (i*spacing) + 2*(bar_height/3) + scroll, _x + bar_width, _y + (i*bar_height) + (i*spacing) + 2*(bar_height/3) + 10 + scroll, true);
        // Draw Achievement Progress
        draw_set_color(c_black);
        progress = 0;
        if(Sc_String_Decipher(1, '_', name) == "asteroids")
        {
            progress = gms_ini_player_read("Achievements", "asteroids_destroyed") / real(total);
        }
        else if(Sc_String_Decipher(1, '_', name) == "resource")
        {
            progress = gms_ini_player_read("Achievements", "resources_collected") / real(total);
        }
        else if(Sc_String_Decipher(1, '_', name) == "upgrade")
        {
            if(instance_exists(O_Controller))
            {
                progress = O_Controller.ship_upgrade / real(total);
            }
            else
            {
                pregress = 0;
            }
        }
        if(progress > 1)
        {
            progress = 1;
        }
        draw_rectangle(_x, _y + (i*bar_height) + (i*spacing) + 2*(bar_height/3) + scroll, _x + progress*bar_width, _y + (i*bar_height) + (i*spacing) + 2*(bar_height/3) + 10 + scroll, false);
        // Draw completion fraction
        draw_set_color(c_black);
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        draw_text(_x + bar_width, _y + (i*bar_height) + (i*spacing) + 2*(bar_height/3)-5 + scroll, string(progress*real(total)) + "/" + string(real(total)));
        draw_set_halign(fa_left);
        draw_set_valign(fa_top) 
    }
}
// Draw List Header
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_font(fnt_update);
draw_set_color(c_gray);
draw_rectangle(_x - padding, _hy, _x + bar_width + padding, _hy + bar_height, false);
draw_set_color(c_black);
draw_text(_x + bar_width/2, _hy + bar_height/2, "Achievement List");
