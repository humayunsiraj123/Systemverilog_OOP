// abstraction

//abstracted class are those class which cant be instance by objects but can be inherited by sub class .when we dont one direct acces to specific class we use class abstraction.

//virtual keyword is use for abstraction
 


// abstract class method with "pure keyword"
// we just define the prototype inside the abstract class and define the fucntion in base classes 



 virtual class Base;
  int base;
  
  function new(int base = 32'hffffffff);
    this.base= base;
  endfunction
pure virtual function int getbase(); //abstract function prototype declaration

endclass




class Child extends  Base;
int data ;

 function new( int data,int base);
	super.new(base);
this.data=data;
endfunction 

virtual function int getbase();
return base;
endfunction 
	
endclass

  
  module class9;
   ///  Base obj; //object wont creat as of virtual keywrod with class;
    Child  obj;
	int f_rtn;
initial begin
    	  
      obj = new('haa,'hbb);
      
      $display("the value of base %h data %h  ",obj.base,obj.data);
	f_rtn=obj.getbase();  // abstract   function call  
   $display("the value of  base from virtual function %h",f_rtn); 	
 end
  endmodule
