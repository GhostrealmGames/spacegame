// Show Highscore table
/*highscore_set_font(fnt_highscore, 12, 0);
highscore_set_colors(c_black, c_aqua, c_red);
highscore_set_strings("Top Ten Local Scores", "<nobody>", "press <Escape> to close");
highscore_show(score);*/
highscore_add("Test", score);
draw_highscore(600, 600, 1000, 1000);
//gms_highscore_add(1381, score);
game_over = false;
score = 0;
// Restart Game
room_restart();
room_goto(R_Title);
