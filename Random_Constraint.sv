// Code your testbench here
// or browse Examples
class Packet;
rand bit[2:0] mode; //randc for cyclic random 
rand bit [7:0]data;
rand bit [7:0]chksm;
rand bit [7:0] response;
rand bit [7:0] rx_data;
  rand bit [7:0] tx_data;
  rand bit [2:0] d_arry[];
  rand bit [2:0] queue[$];
  

//constraint m1 {mode>1 ; mode<5;}
//constraint m2 {data>'hf ; data<'haf;}
  constraint c_array {
    d_arry.size() >4 ; d_arry.size()<10;} // set the size of array b/w 5to 10;
  
  constraint c_index {foreach(d_arry[i])
    d_arry[i] inside {[2:20]};
   } // set the size of array b/w 5to 10;
  
  constraint q_size { queue.size()>8; queue.size()<15;}
 // constraint q_val  {queue inside {[1:5]};}
  
  
  
  
  constraint m3 {data inside {[5:10]};// data range 5:9;
		mode inside {[2:6]};
               chksm inside {'haa,'hbb,'hff}; //23,28,25 with equal probablity
		!(response inside {[2:10]}); // response not 2to10 ;
	 }
// 
constraint m4 { rx_data dist { 10:=25, 20:=25 ,50:=50}; //10 probablity is 25 per 20 has 25 probablity 50 has 50 percent chances while randomize; 

}
  
  constraint m5 {tx_data dist {2:/20 , 10:/40 , 'hff:/40};}// 2  20% prob 10 40% prob ff  40% chancess; 

// constraints


function void display();
  $display("the value of mode %h and data  %h , chksum %h , response %d ,rx_data %d tx_data %d",mode,data,chksm,response,rx_data,tx_data);
endfunction
endclass


module  Random_Contraint;

Random_Constraint p1;

initial begin

p1 =new();

  for (int i=0; i<10; i++) begin 
p1.randomize();
p1.display();
    foreach(p1.d_arry[j])
      $display( "the value at index %d  = %d  ",j,p1.d_arry[j]);
    $display ("ranom queue %p" ,p1.queue);
      
#10;
end

end
endmodule
