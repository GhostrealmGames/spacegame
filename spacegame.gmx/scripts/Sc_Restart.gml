// Show Highscore table
/*highscore_set_font(fnt_highscore, 12, 0);
highscore_set_colors(c_black, c_aqua, c_red);
highscore_set_strings("Top Ten Local Scores", "<nobody>", "press <Escape> to close");
highscore_show(score);*/
//draw_set_font(fnt_highscore);
//highscore_add("Test", score);
//draw_highscore(600, 600, 1000, 1000);
gms_highscore_add(1528, score);
game_over = false;
score = 0;
gms_show_highscore(1528);
alarm[11] = 10 * room_speed;
while(alarm[11] > 0){};
//draw_set_font(-1);
// Restart Game
room_persistent = false;
room_goto(R_Title);
