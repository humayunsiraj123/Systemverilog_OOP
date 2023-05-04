
class transmit;
static int count=0;//static variable scope inside the class act as global  ver but encapsulate inside the class
  bit [7:0] addr,csm,data[8];
    function new(bit[7:0] addr ='h01,csm='h0,data='h11);
      this.addr=addr;
      this.csm=csm;
      this.data[0]=data;
	count+=1;
    endfunction

function void disp_count();
$display("class has been instantiated %d ",count);  
  endfunction

extern function void display();
    
    endclass
// we can write function outside th class eclaering function in class adn use "extern keyword to define the fucntion"   
  
    function void transmit::display();
      $display("TX the value of addr %d ,CSM %d , data",addr,csm,data[0]);
    endfunction;
       
  module class4;
    transmit  tx,tx1,tx2,tx4;
    initial begin
    tx=new('haa,'hbb,'hff);
      tx.display();
	tx.disp_count();
      tx = new();
      tx.display();
      tx.disp_count();
tx.addr ='h11;
      tx.display();
tx2=new('had,'hff,'hda);
tx2.disp_count();
tx4=new();
tx4.addr='h00;
tx4.disp_count();
$display(" the class has been instantiate  %d times ",transmit::count);//accessing class varible wiht class name its static memeber can be access without clas handle but at class to 

    end
  endmodule