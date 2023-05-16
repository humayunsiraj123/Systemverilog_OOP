
class Base;

byte pub_var ='hff;
local byte local_var ='haa; // local is only accessible in base class methods also non local which access local and be ovveriden or inherited
byte inher =local_var; 
function void display();
$display("pub_var %h    local_var %h",pub_var,local_var);
endfunction  

endclass


//when local is access but child directly 
class Child extends  Base;
byte inher_var;
byte pub_var;

function void display();

//$display("inherited var from base %h",local_var); //local is not accessible by child its carries "local" keyword illegal accee to local varible 
$display("inherited var from base %h",inher); //local is not accessible by child its carries "local" keyword illegal accee to local varible 

endfunction


endclass


module class12;

byte pub_var;
byte local_var;


Base b1;
Child c1;
initial begin
b1=new();
b1.display();
c1=new();
c1.display(); //its gives error as 
$display("pub_var %h  ",b1.pub_var);
//$display("local_var %h  ",b1.local_var); //give compilation error as its acces not allowed 
$display("local_var %h  ",c1.inher); //access local var with non local var; 

end
endmodule