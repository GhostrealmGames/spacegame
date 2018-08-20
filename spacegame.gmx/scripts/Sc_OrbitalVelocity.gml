var dist_x, dist_y, dist, angle_object, orbitalvelocity;
if(argument_count > 2)
{
    if(argument[2] == true)
    {
        offset = random_range(0.9, 1.1);  // changes eccentricity of the orbit
    }
    else
    {
        offset = 1;
    }
}
else
{
    offset = random_range(0.9, 1.1);  // changes eccentricity of the orbit
}
// Distance
dist_x = argument[0].x - argument[1].x;
dist_y = argument[0].y - argument[1].y;
dist = sqrt(sqr(dist_x) + sqr(dist_y))
// Angle
angle_object = point_direction(argument[0].x, argument[0].y, argument[1].x, argument[1].y);

// Set Orbital Velocity
orbitalvelocity = sqrt((Gravitational_Constant * argument[1].mass)/(dist/argument[0].mass));
motion_add(angle_object + 90, orbitalvelocity * offset); // might need to be changed to add
return orbitalvelocity;
