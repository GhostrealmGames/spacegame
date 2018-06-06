// Adds accerleration due to gravity to an object
var dist_x, dist_y, /*dist, angle_object,*/ force_gravity;
// Distance
dist_x = argument0.x - argument1.x;
dist_y = argument0.y - argument1.y;
dist = sqrt(sqr(dist_x) + sqr(dist_y));
// Angle
angle_object = point_direction(argument0.x, argument0.y, argument1.x, argument1.y);

// Add Gravity
force_gravity = (Gravitational_Constant * argument0.mass * argument1.mass)/power(dist, 2);
motion_add(angle_object, force_gravity);
return force_gravity;
