room_goto(R_Main);
room_persistent = false;
alarm[11] = 3 * room_speed;
while(alarm[11] > 0){};
room_goto(R_Title);
