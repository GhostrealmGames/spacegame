var pos, prt1, prt2;
//argument0 = which half to return (1=1st Half) (2=2nd Half)
//argument1 = specific character to split string (i.e. '+' or '-')
//argument2 = string to split
{
    pos = string_pos(argument1,argument2);
    if(pos == 0) return argument2;
    prt1= string_copy(argument2,0,pos-1);
    prt2= string_copy(argument2,pos+1,string_length(argument2));
    if(argument0==1) return prt1;
    if(argument0==2) return prt2;
}
