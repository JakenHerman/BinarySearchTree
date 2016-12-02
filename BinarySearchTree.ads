PACKAGE binarysearchtree IS
    TYPE string10 IS NEW string
        (1 .. 10);

    TYPE binarysearchtreepoint IS LIMITED PRIVATE;
    PROCEDURE init;
    PROCEDURE allocatenode(q : OUT binarysearchtreepoint; namekey: IN string10; numkey : IN string10);
    PROCEDURE insertnode(p : IN OUT binarysearchtreepoint; q : IN OUT binarysearchtreepoint; namekey : IN string10; numkey : IN string10);

    PROCEDURE insertbinarysearchtree (
        custname  : IN     string10;
        custphone : IN     string10);
    PROCEDURE findcustomeriterative (
        custname      : IN     string10;
        customerpoint :    OUT binarysearchtreepoint);
    PROCEDURE findcustomerrecursive (
        custname : IN string10;
        custpoint : OUT binarysearchtreepoint);
    PROCEDURE findcustomerrecursive (
        startnode : IN binarysearchtreepoint;
        customername  : IN     string10;
        customerpoint :    OUT binarysearchtreepoint);
    FUNCTION inordersuccessor (
        treepoint : IN     binarysearchtreepoint)
        RETURN binarysearchtreepoint;
    FUNCTION customername (
        treepoint : IN     binarysearchtreepoint)
        RETURN string10;
    FUNCTION customerphone (
        treepoint : IN     binarysearchtreepoint)
        RETURN string10;
    PROCEDURE inordertraversal(startnode : IN binarysearchtreepoint);


PRIVATE
    TYPE customer IS
    RECORD
        name        : string10;
        phonenumber : string10;
    END RECORD;

    TYPE node;
    TYPE binarysearchtreepoint IS ACCESS node;

    TYPE node IS
    RECORD
        llink,
            rlink : binarysearchtreepoint;
        ltag,
            rtag  : boolean;
        info  : customer;
    END RECORD;

END binarysearchtree;