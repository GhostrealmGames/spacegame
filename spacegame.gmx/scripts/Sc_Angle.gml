// Gets the angle relative to an oject
var dist_x, dist_y, dist, angle_planet, angle_object;
dist_x = argument0.x - argument1.x;
dist_y = argument0.y - argument1.y;
dist = sqrt(sqr(dist_x) + sqr(dist_y));
angle_planet = abs(arctan(dist_y/dist_x))*(180/pi);
//Not Needed
/*if (dist_x > 0 && dist_y < 0) {} else */
if (dist_x < 0 && dist_y < 0)
{
    angle_planet = (90-angle_planet) + 90;
}
else if (dist_x < 0 && dist_y > 0)
{
    angle_planet = angle_planet + 180;
}
else if (dist_x > 0 && dist_y > 0)
{
    angle_planet = (90-angle_planet) + 270;
}

if (angle_planet > 180)
{
    angle_object = (angle_planet + 180) - 360;
}
else
{
    angle_object = angle_planet + 180;
}
return angle_object;
