var dist_x, dist_y, dist, angle_object, orbitalvelocity;
offset = .90
// Distance
dist_x = argument0.x - argument1.x;
dist_y = argument0.y - argument1.y;
dist = sqrt(sqr(dist_x) + sqr(dist_y))
// Angle
angle_object = point_direction(argument0.x, argument0.y, argument1.x, argument1.y);

// Set Orbital Velocity
orbitalvelocity = sqrt((Gravitational_Constant * argument1.mass)/(dist/argument0.mass));
motion_add(angle_object + 90, orbitalvelocity * offset); // might need to be changed to add
return orbitalvelocity;
