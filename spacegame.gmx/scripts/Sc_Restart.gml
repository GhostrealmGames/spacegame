game_over = false;
room_persistent = false;
if(room == R_Menu_Pause)
{
    gms_highscore_add(1528, score);
    score = 0;
    gms_show_highscore(1528);
    global.newgame = true;
}
else if(room == R_Tutorial_Pause)
{
    global.newtutorial = true;
}
else
{
    gms_highscore_add(1528, score);
    score = 0;
    gms_show_highscore(1528);
    global.newgame = true;
}
alarm[11] = 10;
