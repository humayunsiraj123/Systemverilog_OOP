// Code your testbench here
// or browse Examples
class Package;
  rand bit [7:0]v1,v2,v3,v4;

  //   //There are two constraints applied to same variable ‘A’. one will
// generate the value within the range of [25:50] and another expression
// say variable value should be greater than 40. What should be the value
// generated, and what is the reason?
  rand bit [7:0] A;
  
  constraint con_A{ A inside {[25:50]};};
  constraint con_A2{ A >40;};
  
//   4. Write a single constraint to generate random values for bit [8:0]
// variable in the below range, 1-34, 127, 129-156, 192-202,257-260.
  
  
  rand bit[7:0]B;
  constraint conB{B inside {[1:34],127,[129:156],[192:202]};};

  
  //   5. Write a constraint without an inside function to generate random
// values within the range of 34 to 43?
  rand bit [7:0]C;
  constraint conC {C>34;C<43;};
  
//   Write a constraint to generate a random value for a var1 [7:0] within
// 50 and var2 [7:0] with the non-repeated value in every randomization?
  rand bit [7:0]var2,var1 ;
  constraint con_var1 {var1<50;};
  constraint con_var2 {unique{var2};};
  
  
//   Without using randomization method or rand keyword(modifiers),
// generate an array of unique values.
  rand bit[7:0] arry[5];
  constraint arry_con {foreach(arry[y]) 
    arry[y]==y*y;};
  
//   Write a constraint to generate a pattern 0102030405.
  rand bit[7:0] val[];
  constraint val_con {val.size() inside{[10:20]};
                      foreach(val[i]){
                        if(i%2 ==0)
                        {val[i]==0;}
                     	else
                        {val[i]== (i+1)/2;}
                          }};
//   18. Write a constraint to generate prime numbers between the range of
// 1 to 100
                        rand bit[7:0]prime;
                        constraint pcon {prime inside{[1:100]};
                                         prime !=1;
                                        
                                         if(prime ==2){
                                           prime==2;}
                                         else{
                                           prime%2 !=0;}
                                         if(prime ==3){
                                           prime==3;}
                                         else{
                                           prime%3 !=0;}
                                         if(prime ==5){
                                           prime==5;}
                                         else{
                                           prime%5 !=0;}
                                         if(prime ==7){
                                           prime==7;}
                                         else{
                                           prime%7 !=0;}
                                                                         
                                        };
  
endclass


module myclass();
  Package p1;
  initial begin
    p1=new();
    p1.v1.rand_mode(0);//v1 wont randomize result zero
    p1.randomize();	
    //$display("value of v1 = %d v2 =%d v3 = %d v4 = %d",p1.v1,p1.v2,p1.v3,p1.v4);
//     repeat(5)begin
//        p1.randomize();	
//       $display("value of A = %d B = %d C = %d",p1.A,p1.B,p1.C);
//       $display("var1  %d  var2 %d" , p1.var1,p1.var2);
//       #10;
//     end
//     foreach(p1.arry[i])
//       $display("at index %d value is %d ",i,p1.arry[i]);
  
  foreach(p1.val[i])
    $display("at index %d value is %d ",i,p1.val[i]);
  
    repeat(5)begin
       p1.randomize();	
      $display("prime %d " ,p1.prime);
      #10;end
  end
endmodule
