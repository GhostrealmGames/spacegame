var _x, _y, _s, _w, _h, _x1, _y1;
_x = argument0; // top left
_y = argument1;
_s = 5;
_w = 400//room_width/_s;
_h = 200//room_height/_s;
//_x1 = argument0 + view_wview[0] - 1 - _w;  // top right
tutoiral_hint = "";

// Draw Tutorial Box Background
if (O_Tutorial.flash_timer > 0 && floor(O_Tutorial.num_flashes mod 2) == 1)
{
    draw_set_color(c_yellow);
}
else
{
    draw_set_color(c_gray); //c_black
}
draw_set_alpha(0.9);
draw_rectangle(_x, _y, _x+_w, _y+_h, false);

// Select Tutorial Hint Text to Draw
switch (O_Tutorial.tutorial_text)
{
    case -1:
        tutorial_hint = "";
        total = 0;
        break;
    case 0:
        tutorial_hint = "Use A & D to turn and W to move forward#Hover over the targets to move on";
        total = 3;
        break;
    case 1:
        tutorial_hint = "Press spacebar to shoot.#Destroy the asteroids to move on.";
        total = 5;
        break;
    case 2:
        tutorial_hint = "Tutroial Complete.";
        total = 0;
        break;
}

// Progress Bar
if (total != 0)
{
    draw_set_alpha(0.9);
    draw_set_color(c_black);
    draw_set_font(-1);
    percent = num_completed/total * 100;
    draw_rectangle(_x, _y+_h-10, _x+_w/100 * percent, _y+_h, false);
    if (percent >= 100)
    {
        O_Tutorial.tutorial_text += 1;
        num_completed = 0;
        O_Tutorial.flash_timer = O_Tutorial.falsh_timer_initial;
        O_Tutorial.num_flashes = O_Tutorial.num_flash_initial;
        if (tutorial_text == 1)
        {
            for (i = 0; i < 10; i+=1)
            {
                do {
                    dist = sprite_get_width(Sp_ShipV1)/2 + random_range(O_Tutorial_Main.inner_radius, O_Tutorial_Main.outer_radius);
                    dir = random(360);
                } until (collision_circle(x+lengthdir_x(dist, dir), y+lengthdir_y(dist, dir), sprite_get_width(Sp_ShipV1), O_Ship, true, true) == noone && collision_circle(x+lengthdir_x(dist, dir), y+lengthdir_y(dist, dir), sprite_get_width(Sp_ShipV1), O_Tutorial_Asteroid, true, true) == noone)
                instance_create(960 + lengthdir_x(dist, dir), 640 + lengthdir_y(dist, dir), O_Tutorial_Asteroid);
            }
        }
    }
    draw_rectangle(_x, _y+_h-10, _x+_w, _y+_h, true);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(_x+_w/2, _y+_h-10, string(num_completed) + "/" + string(total));
}
if (O_Tutorial.flash_timer > 0)
{
    O_Tutorial.flash_timer -= 1/room_speed;
}
if (O_Tutorial.flash_timer < .1 && O_Tutorial.num_flashes > 0)
{
    O_Tutorial.flash_timer = O_Tutorial.falsh_timer_initial;
    O_Tutorial.num_flashes -= 1;
}
if (O_Tutorial.tutorial_text >= 2 && O_Tutorial.flash_timer <= 0)
{
    tutorial_complete = true;
}

// Outline
draw_set_alpha(0.9);
draw_set_color(c_white);
draw_rectangle(_x,_y,_x+_w,_y+_h,true);

// Draw Tutorial Hint Text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_set_font(-1);
draw_set_alpha(1);
draw_text(_x + _w/2, _y + _h/2, tutorial_hint);

if (tutorial_complete)
{
    if (!gms_achievement_isreached("complete_tutorial"))
    {
        gms_achievement_reach("complete_tutorial");
    }
    global.newtutorial = true;
    room_goto(R_Title);
}

// Debug
if (global.debug)
{
    draw_set_color(c_red);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_text(_x+_w/2, _y+_h-25, string(O_Tutorial.flash_timer));
    draw_text(_x+_w+25, _y + 25, string(tutorial_complete));
    if (keyboard_check_pressed(vk_numpad1))
    {
        num_completed += 1;
    }
}
