room_persistent = false;

if(room == R_Tutorial_Pause)
{
    global.newtutorial = true;
}
else
{
    if(gms_highscore_list_count() > 0)
    {
        list_id = gms_highscore_list_id(0);
        gms_highscore_add(list_id, score);
    }
    score = 0;
    instance_create(0, 0, O_Highscores);
    global.newgame = true;
}
alarm[11] = 10;
