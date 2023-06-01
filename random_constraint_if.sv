// Code your testbench here
// or browse Examples
class sample;
  typedef enum logic [3:0] {a,b,c,d}enum_t;
  rand enum_t  array[];
  
              
  //rand bit[4:0] array[];
		
constraint array_C {
	
  array.size() inside {[20:30]};
	foreach(array[i]) {
      array[i] inside {a,b};
      if(i>0){
        if(array[i-1]==a) array[i] inside{c,d};
      else array[i] inside {b,a};
     
      }}
}
endclass

module top;
  sample s=new();

initial begin
  repeat(10) begin
    s.randomize(); //with {array.size()==20;};
		$display("Array = %p",s.array);
   // $display("sum = %0d",int'(s.array.sum()));
	end
end
endmodule
