WITH ada.text_io, ada.text_io.unbounded_io, ada.strings.unbounded,binarysearchtree;
USE ada.text_io, ada.text_io.unbounded_io, ada.strings.unbounded,binarysearchtree;

PROCEDURE bst IS
    PACKAGE integer_in_out IS NEW ada.text_io.integer_io(integer);
    USE integer_in_out;

    userin : integer;
    main : binarysearchtreepoint;

    PROCEDURE get10 (
            s : IN OUT string10) IS
        buf : unbounded_string;
    BEGIN
        buf := get_line;

        FOR i IN string10'RANGE LOOP
            IF i <= length(buf) THEN
                s(i) := element(buf,i);
            ELSE
                s(i) := ' ';
            END IF;
        END LOOP;
    END get10;

    name  : string10 := (OTHERS => ' ');
    phone : string10 := (OTHERS => ' ');
BEGIN
    init;
    put_line("OPCODES: ");
    put_line("1. Insert");
    put_line("2. Find Recursive");
    put_line("3. FindIterative");
    put_line("4. Find In Order Sucessor");
    put_line("5. Traverse Tree Inorder");
    put_line("6. Exit");
    LOOP

        put_line(" ");
        get(userin);
        skip_line;
        CASE userin IS
            WHEN 1 =>
                get10(name);
                get10(phone);
                insertbinarysearchtree(name, phone);
                put(string(name));
                put(" , ");
                put(string(phone));
                put(" has been inserted");
                new_line;

            WHEN 2 =>
                put_line("Recursive Search :");
                put("Searching for ");
                get10(name);
                put_line(string(name));
                findcustomerrecursive(name, main);
                IF customername(main) = name THEN
                    name := customername(main);
                    phone := customerphone(main);
                    put_line(" ");
                    put_line("Found");
                    put(string(name));
                    put(" : ");
                    put_line(string(phone));
                    put_line(" ");
                ELSE
                    put_line("Customer is not in our Tree");
                END IF;
            WHEN 3 =>
                put_line("Iterative Search : ");
                put("Searching for ");
                get10(name);
                put_line(string(name));
                findcustomeriterative(name,main);
                IF customername(main) = name THEN
                    name := customername(main);
                    phone := customerphone(main);
                    put_line(" ");
                    put_line("Found");
                    put(string(name));
                    put(" : ");
                    put(string(phone));
                    put_line(" ");
                ELSE
                    put_line("Customer is not in our Tree");
                END IF;

            WHEN 4 =>
                put_line("In Order Successor : ");
                put(string(customername(inordersuccessor(main))));
            WHEN 5 =>
                put_line("Traverse Tree Inorder : ");
                put_line("Starting Point: ");
                get10(name);
                findcustomerrecursive(name, main);
                IF customername(main) = name THEN
                    inordertraversal(main);
                ELSE
                    put_line("Starting point must be valid.");
                END IF;
            WHEN 6 =>
                EXIT;
            WHEN 9 =>
                put_line("Select a operation:");
                put_line("1. Insert");
                put_line("2. Find Recursive");
                put_line("3. FindIterative");
                put_line("4. Find In Order Sucessor");
                put_line("5. Traverse Tree Inorder");
                put_line("6. Exit");

            WHEN OTHERS =>
                put_line("Invalid option.");

        END CASE;
    END LOOP;
END bst;