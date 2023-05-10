//polymorphisms  help to use attr and method of  childclass  by parentclass secondly it helps to have alternate definition of baseclass  and childclass methods with same names in both the class 


class Base;
byte data;

function new(byte data = 'hff);
this.data=data;
endfunction

virtual function void display();
$display("the value of the from base class data  %h",data);
endfunction
endclass

class child1 extends Base;
byte data;

function new(byte data = 'haa);
this.data=data;
endfunction

function void display();
$display("the value of the child1 data  %h",data);
endfunction
endclass




class child2 extends Base;
byte data;

function new(byte data = 'hbb);
this.data=data;
endfunction

function void display();
$display("the value of the child2 data %h",data);
endfunction
endclass

class child3 extends Base;
byte data;

function new(byte data = 'h00);
this.data=data;
endfunction

function void display();
$display("the value of the child3 data  %h",data);
endfunction
endclass


module class11;

child1 c1;
child2 c2;
child3 c3;

child1 c4;
child2 c5;
child3 c6;

Base obj[7];

initial begin;


obj[0] = new(); //base class handle
obj[0].display(); //call display from base class

c1 =new();
c2 =new();
c3 =new();

obj[1]=c1;
obj[2]=c2;
obj[3]=c3;

obj[1].display(); //call display fucntion from of child1 as display has been redefine
obj[2].display();
obj[3].display();

c4 =new();
c5 =new();
c6 =new();

obj[4]=c4;
obj[5]=c5;
obj[6]=c6;

obj[4].display(); //call display fucntion from of child1 as display has been redefine
obj[5].display();
obj[6].display();

end 
endmodule





