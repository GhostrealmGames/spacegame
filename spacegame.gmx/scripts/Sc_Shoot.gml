var Missile, Magnitude, Direction, O_fireing, delta_x, delta_y, angle, distance;//, obj_angle;
obj_angle = argument1.spr_angle;
angle_offset = 80;
if (argument1 == O_Ship.id)
{
    if (global.ship_upgrade == 3)
    {
        r = 63;
    }
    else
    {
        r = 35;
    }
}
else
{
    r = 0;
}
delta_x = r*cos(obj_angle + angle_offset);
delta_y = r*sin(obj_angle + angle_offset);
angle = point_direction(0, 0, delta_x, delta_y);
distance = point_distance(0, 0, delta_x, delta_y);

Missile = instance_create(argument1.x + lengthdir_x(distance, obj_angle + angle_offset), argument1.y + lengthdir_y(distance, obj_angle + angle_offset), argument0);
Missile2 = instance_create(argument1.x + lengthdir_x(distance, obj_angle - angle_offset), argument1.y + lengthdir_y(distance, obj_angle - angle_offset), argument0);
if (global.debug)
{
    instance_create(argument1.x + lengthdir_x(distance, obj_angle + angle_offset), argument1.y + lengthdir_y(distance, obj_angle + angle_offset), O_center);
    instance_create(argument1.x + lengthdir_x(distance, obj_angle - angle_offset), argument1.y + lengthdir_y(distance, obj_angle - angle_offset), O_center);
}

O_fireing = argument1;
with(Missile)
{
    Magnitude = 50;
    Direction = O_fireing.spr_angle - 1;
    motion_set(Direction, Magnitude);
    image_angle = Direction;
    created_by = O_fireing;
}
with(Missile2)
{
    Magnitude = 50;
    Direction = O_fireing.spr_angle + 1;
    motion_set(Direction, Magnitude);
    image_angle = Direction;
    created_by = O_fireing;
}
if (O_fireing == O_Ship.id)
{
    O_fireing.shooting = true;
    alarm[1] = O_fireing.shootspeed*room_speed;
}
else
{
    shooting = true;
    alarm[1] = 5 * room_speed;
}
