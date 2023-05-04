// Code your testbench here
// or browse Examples
class myclass;
  
  bit[7:0] addr;
  bit [7:0] data;
  
  function new(bit[7:0]addr=2,bit[7:0]data='h11);
    this.addr =addr;
    this.data = data; //this is pointing to class attributes 
  endfunction
  
  function void display();
    $display("the addr %d   and value is %h",this.addr,this.data);
  endfunction
  
endclass

module class2();
  bit[7:0] addr_v;
  bit[7:0] data_v;
  

//class instance 
  myclass obj; 
  myclass obj2;
 
//array of class 
 myclass arr_obj[5];

  initial begin
    
  obj = new(50); //with constructors values
    obj2= new(); //with default constructor value 
    for( int i =0 ;i<5;i++)
	begin
	arr_obj[i] =new(i,$urandom_range('haa,'hff)); //arry of class obj with loop index as addr and random data
	
arr_obj[i].display();	
	end

 obj.display();
   obj2.display();// they return data as default value 


end
endmodule
  
