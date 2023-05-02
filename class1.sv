// Code your testbench here
// or browse Examples
//*************************DAY1*******************************
//class transaction

// enclose class in pakage
package class_pack;
class transaction;
  bit[31:0] addr,csm;
  bit[31:0]data[8];
  
  function void display();
    $display("Transaction %h",addr);
  endfunction
  //class funstions
  function void calc_csm();
    csm =adrr ^data.xor;
  endfunction
  //custom class constructor
  function new();
    addr='hff;
    data = '{default :'hff};
    endfunction
  
endclass
endpackage

// object instance of class in a program block
program automatic program1;
  import class_pack :: *;
  transaction tr;// tr class handle pointer to the class instance
  tr=new(); // new is class constructor it will call when whenever the class begin called ;
  //its default is null but we can customized  it as well
endprogram
