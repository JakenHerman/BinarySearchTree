with Ada.Text_IO; use Ada.Text_IO;

package body BinarySearchTree is 
count : integer := 0; -- how many nodes in the tree?
stack_count : integer := 0;
sorted_count : integer := 1;
pre_order_stack : array (1 .. 100) of BinarySearchTreePoint;
pre_order_sorted : array (1 .. 100) of BinarySearchTreePoint;

   --insert iteratived
   procedure InsertBinarySearchTree(Root : in out BinarySearchTreePoint;
				    custName : in String10;
				    CustPhone : in String10) is
      p : binarySearchTreePoint := root;
      q : binarySearchTreePoint := root;
      t : binarySearchTreePoint;

   BEGIN
      count := count+1;
      t := NEW node;
      t.info.name:=custName;
      t.info.phoneNumber:=custPhone;
      t.rLink:=t;
      t.lLink:=t;

      IF root = NULL THEN
         root:=t;
      ELSE
         LOOP
            IF q/=NULL THEN
               IF custName < q.info.name THEN
                  IF q.lLink=p THEN
                     p:=q;
                     EXIT;
                  END IF;
                  p:=q;
                  q:=q.lLink;
               ELSIF q.rTag = true THEN
                  p:=q;
                  q:=q.rLink;
               ELSE
                  p:=q;
                  EXIT;
               END IF;
            ELSE
               EXIT;
            END IF;
         END LOOP;

         IF p.info.name > custName THEN
            t.lLink:=p.lLink;
            p.lTag := true;
            t.rLink:=p;
            t.rTag:=false;
            IF t.lTag=true THEN
               t.lLink.rLink:=t ; --check for child and rethread tree
            END IF;
         ELSIF p.info.name <= custName THEN
            p.rLink:=t;
            p.rTag:=true;
            t.lLink:=p;
            t.lTag:=false;
            IF t.rTag=true THEN
               t.rLink.lLink:=t; --check for child and rethread tree
            END IF;
         END IF;
      END IF;
   end InsertBinarySearchTree;

   PROCEDURE init( Root : IN OUT BinarySearchTreePoint) IS
   BEGIN
    Root := Null;
   END;
   
   procedure FindCustomerIterative(Root : in BinarySearchTreePoint;
				   CustomerName : in String10;
				   CustomerPoint : out BinarySearchTreePoint) is
      p    : binarySearchTreePoint := root;
      temp : integer               := count;
   BEGIN
      LOOP
         IF temp = 0 THEN
            p:=root;
            EXIT;
         ELSIF p.info.name = customerName THEN
            customerPoint:= p;
            EXIT;
         ELSIF p.info.name > customerName THEN
            p:=p.lLink;
         ELSIF p.info.name <= customerName THEN
            p:=p.rLink;
         END IF;

         temp:=temp-1;
      END LOOP;
      customerPoint:=root;
   end FindCustomerIterative;
   
   procedure PreOrder(Root : in BinarySearchTreePoint) is
      Pt : BinarySearchTreePoint := Root;
   begin
      loop
        if Pt /= null then
          pre_order_sorted(sorted_count) := Pt;
          stack_count := stack_count + 1;
          pre_order_stack(stack_count) := Pt;
          Pt := Pt.Llink;
        else
          if pre_order_stack(1) = null then
            exit;
          else
            pt := pre_order_stack(stack_count);
            stack_count := stack_count - 1;
            pt := pt.rlink;
          end if;
        end if;
      end loop;
   end;
  
  -- needs fixing
  procedure FindCustomerRecursive(Root : in BinarySearchTreePoint;
                                  CustomerName : in String10;
                                  CustomerPoint : out BinarySearchTreePoint) is
  
   begin
    if CustomerName = Root.Info.Name then
      put("hello");
      CustomerPoint := Root;
    else
      put("no");
      CustomerPoint := Root;
    end if;
   end FindCustomerRecursive;
   
   --assume TreePoint points to a node of a threaded binary tree.
   --iterative function
   function InOrderSuccessor(TreePoint : in BinarySearchTreePoint)
			    return String10 is
      p : binarySearchTreePoint;
      q : binarySearchTreePoint;
   BEGIN
      p:=treePoint;
      q := p.rLink;
      IF p.rTag = false THEN
         p:=q;
      ELSE
         WHILE q.lTag = true LOOP
            q := q.lLink;
         END LOOP;
         p:=q;
      END IF;

      RETURN p;
   end InOrderSuccessor;
   
   function CustomerName(TreePoint : in BinarySearchTreePoint) return String10 is
   begin
      return TreePoint.info.name;
   end CustomerName;
   
   function CustomerPhone(TreePoint : in BinarySearchTreePoint) return String10 is
   begin
      return TreePoint.info.PhoneNumber;
   end CustomerPhone;
   
begin
   null;
end;
