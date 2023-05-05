//inheritance  class aquiring  the properties and methods of base/parent class

class Data_pack;
bit[2:0] header;
bit encode;
bit[7:0]data;
bit[2:0]mode;
bit stop;


function new(bit [2:0] header ='h3,bit[2:0] mode=3'b111,bit [7:0] data='hff);
this.header=header;
this.stop=1;
this.encode=0;
this.mode=mode;
this.data=data;
endfunction

extern function void display();

endclass

function void Data_pack::display(); // defining function of data class outside the class 
$display("the mode %b  header %b   encode %b stop %b data %h ",mode,header,encode,stop,data);
endfunction



class Checker extends Data_pack; //aquring methods and attr from Data_pack class;

bit parity ;
bit[1:0]crc;

function new();
super.new('h1,'h1,'haa); // super keyword when call it will call the constuct of parent class
this.parity =1;
this.crc='b11;
endfunction


function void display();
super.display();//calling fucntion from base class 
$display("the paritybit is %b  and crc %b" ,this.parity,this.crc);
endfunction
endclass

module class6;
Checker chk,chk2;
Data_pack dp;

initial begin

chk=new();// paassing argument to base class construct which will pass to base class 
chk.display(); 
dp=new();
dp.display();
chk2=new();
chk2.parity=0;
chk2.crc='h1;
chk2.display();

end
endmodule

 

