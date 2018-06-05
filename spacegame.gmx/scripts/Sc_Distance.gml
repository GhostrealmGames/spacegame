// Gets the distance to the center of an object
var dist_x, dist_y, dist;
dist_x = argument0.x - argument1.x;
dist_y = argument0.y - argument1.y;
dist = sqrt(sqr(dist_x) + sqr(dist_y))
return dist;
