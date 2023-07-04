package class_pack;
class Packets;
  rand bit [7:0]data;
  rand bit [7:0]chksm;
  rand bit [7:0]rx_info;
  rand bit [7:0]tx_info;
  rand bit [7:0]data_arr[];
  rand bit [7:0]ques[$];
  rand bit [2:0]mode; 
  
  constraint mod_c {
  mode>3;
    mode<6;
    mode inside {[3:6]};
  }
  constraint array_c {data_arr.size() inside {[20:50]};}
  
  constraint value_c{foreach(data_arr[i])
    data_arr[i] inside {['hf:'hff]};
  
  }
  
  constraint q_size_c {ques.size inside{24,15,20};}
  
  constraint c1 {
    data inside {[100:255]};
    chksm inside {'ha,'hf};
//     !(mode inside {[3:6]});   
  }
  
  
  constraint c2 {
    rx_info dist {10:=20, 50:=40 ,99 :=20,199:=10, 255:=10 };
  }
    
  constraint c3 {
    tx_info dist {10:/20, 50:/40 ,99 :/20,199:/10, 255:/10 };
  }
  
  function void display();
  $display("the value of mode %h and data  %h , chksum %h  ,rx_data %d tx_data %d",mode,data,chksm,rx_info,tx_info);
endfunction
  
endclass
endpackage

module test();
  import class_pack:: *;
  Packets p;
  
  initial begin
  p=new();
   p.randomize;
    p.display();
     p.randomize;
    p.display();
     p.randomize;
    p.display();
     p.randomize;
    p.display();
     p.randomize;
    p.display();
    foreach(p.data_arr[j])
      $display( "the value at index %d  = %d  ",j,p.data_arr[j]);
    foreach(p.ques[i])
      $display ("ranom queue %h" ,p.ques[i]);
    $display ("ranom queue %p" ,p.ques);
  #10;  
  end
endmodule
