//polymorphisms  help to use attr and method of  childclass  by parentclass secondly it helps to have alternate definition of baseclass  and childclass methods with same names in btoht the class
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



class Checker;

bit parity ;
bit[1:0]crc;

function new(bit parity,bit[1:0]crc);
this.parity = parity;
this.crc = crc;
endfunction


function void display();
$display("the paritybit is %b  and crc %b" ,this.parity,this.crc);
endfunction
endclass
module class7;

Data_pack  DP;
Checker    CHK;

initial begin;
CHK = new('h1,'h11);
DP.display();
CHK.display();
DP=CHK;
 
DP.display();
end
 endmodule




 
