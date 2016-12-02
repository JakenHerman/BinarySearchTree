PACKAGE BODY gstack IS
    s:ARRAY(1..max) OF item;
    top : integer RANGE 0..max;

    PROCEDURE push(x : IN item) IS
    BEGIN
        top := top + 1; s(top) := x;
    END push;

    PROCEDURE pop(x : OUT item) IS
    BEGIN
        x:=s(top); top := top -1;
    END pop;

    FUNCTION empty RETURN integer IS
    BEGIN
        IF top = 0 THEN
            RETURN 1; --true
        ELSE
            RETURN 99; --false
        END IF;
    END empty;
BEGIN
    top := 0;
END gstack;