
// Code your testbench here
// or browse Examples

class transmit;

  bit [7:0] addr,csm,data[8];
    function new(bit[7:0] addr,csm,data);
      this.addr=addr;
      this.csm=csm;
      this.data[0]=data;
    endfunction
  extern function void display();
    
    endclass
// we can write function outside th class eclaering function in class adn use "extern keyword to define the fucntion"   
  
    function void transmit::display();
      $display("TX the value of addr %d ,CSM %d , data",addr,csm,data[0]);
      
    endfunction;
    
    class receive;
  bit [7:0] addr,data[8];
  extern function void display();
    
    endclass
    
      function void receive::display();
        $display(" RX the value of addr %d ,, data",addr,data[0]);
      
    endfunction;
    
    
  module class4;
    transmit  tx;
    receive rx;
    
    initial begin
    tx=new('haa,'hbb,'hff);
      tx.display();
      rx = new();
      rx.display();
      rx.addr ='h11;
      rx.display();
    end
  endmodule