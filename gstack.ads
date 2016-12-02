GENERIC
    max : integer;
    TYPE item IS PRIVATE;
PACKAGE gstack IS
    PROCEDURE push(x : IN item);
    PROCEDURE pop(x : OUT item);
    FUNCTION empty RETURN integer;
END gstack;