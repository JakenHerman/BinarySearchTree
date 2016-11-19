package BinarySearchTree is
   type String10 is new String(1..10);
   
   --Points to a node in a binary search tree
   type BinarySearchTreePoint is limited private;
   
   --This procedure inserts a node (customer) into the tree in search tree order.
   --If a customer with a duplicate name already exists, the new customer should be
   --inserted so they would appear "after" the older customer when the tree is 
   --traversed in inorder traversal. Tree must be threaded in "inorder".
   procedure InsertBinarySearchTree(Root: in out BinarySearchTreePoint; 
				    custName : in String10;
				    custPhone: in String10);
   
   --This procedure locates a customer using a binary search. A pointer is returned
   --to the customer record if they exist, otherwise a null pointer is returned.
   --iterative.
   procedure FindCustomerIterative(Root : in BinarySearchTreePoint;
				   CustomerName : in String10;
				   CustomerPoint : out BinarySearchTreePoint);
   
   
   --This procedure locates a customer using a binary search. A pointer is returned
   --to the customer record if they exist, otherwise a null pointer is returned.
   --recursive.
   procedure FindCustomerRecursive(Root : in BinarySearchTreePoint;
				   CustomerName : in String10;
				   CustomerPoint : out BinarySearchTreePoint);
   
   --This function returns the address of the next node in "inorder", taking 
   --advantage of threads. The user may enter the tree at any random location.
   --This is sometimes called an iteration function or an iterator (no recursion).
   function InOrderSuccessor(TreePoint : in BinarySearchTreePoint)
			    return BinarySearchTreePoint;
   
   --Access function to return customer names and phone numbers.
   function CustomerName(TreePoint : in BinarySearchTreePoint) return String10;
   function CustomerPhone(TreePoint : in BinarySearchTreePoint) return String10;
   
   type Customer is
      record
	 Name : String10;
	 PhoneNumber : String10;
      end record;
   
   type Node;
   type BinarySearchTreePoint is access Node;
   
   type Node is
      record
	 Llink, Rlink : BinarySearchTreePoint;
	 Ltag, Rtag : Boolean; --True indicates pointer to lower level,
	                       -- False a thread.
	 Info : Customer;
      end record;
   
end BinarySearchTree;
