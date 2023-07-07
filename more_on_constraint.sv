// Code your testbench here
// or browse Examples
// Code your testbench herep
// or browse Examples
module test;
  class RC;
    rand int arry[] ;
    rand int no;
    rand int div5;
    rand int odd[];
    rand bit[3:0] val[];
    rand bit[7:0] pre,nxt;
    rand bit [3:0] no_repeat5;
    rand bit [3:0] diff[];
    bit[3:0]old[5];
     int index=0;
    int Q[$];
    rand logic a;
    logic a_res;
    typedef enum {ZERO,ONE,X,Z} data;
    rand data datax;
    rand bit [3:0] array1[],array2[],array3[];
    int sum2=0;
          int sum3=0;
    rand bit gen1;
    
    
//     10.There are two constraints applied to same variable. One will generate the
// value within the range of [25:50] and another expression should be greater
// than 40. What should be the value generated, and what is the reason?
    constraint cons1{
      gen1 inside {[25:50]};
    }
    constraint cons2{
    gen1>40;
    }
     
    
    
    
    
    //[i] array1: no. of elements should be between 30-40.
//[ii] array2: sum of all elements should be < 100
//[iii] array3: sum of all elements should be > 100
    
    constraint array_values{
      array1.size() inside {[30:41]};
      array2.size() inside {[10:50]};
      array3.size() inside {[10:50]};
      foreach(array1[i])
        array1[i]%6==0;
     // array2.sum<100;
      //array3.sum>100;      
    }
    
    //constraint to get 0,1,z,x
    constraint value_4{
      if(a==0)
       datax  inside{ZERO,X};
    
    if(a==1)
      datax inside {ONE,Z};
    }
    
    // contraint to get nonrepeat value compare to prev 5 values
    constraint no_repeat_occr_5{
      diff.size() inside {[20:100]};
      foreach(diff[i]){
        !(no_repeat5 inside{Q});
        diff[i]== (!(no_repeat5 inside{Q}));
        
           }
    }
    
    
    //holding previous values and anoter value is not equal to prev value and tat values contains 5 ones
    constraint detain_prev{
    pre!=nxt;
      $countones(nxt)==5;
    }
    // even value in odd index odd on even index
    constraint odd_on_even_evenon_odd
    {val.size inside {[15:21]};
     foreach(val[i]){
       if(i%2==0){
         val[i]%2==1;
       }
         if(i%2==1){
           val[i]%2==0;
       }
     }
    
           
    }
           //01020304 pattren
    constraint c1{
      arry.size inside {[10:50]};
      foreach(arry[i]){
        if (i % 2 ==0)
          arry[i] ==0;
        else
          arry[i]== (i+1)/2;
      }
    }
        // 10 unique vlaues b/w 99 to a 100
        constraint oneto99{
          no inside {[990:1000]};
          
        }
        ///only divisisble by 5 exclude zero
        constraint div_by_five{
        div5>4;
          div5<100;//excluding zero
          div5%5==0;  
        }
        
        //odd array sizeof 10 to 50 with only odd vlaues
        constraint odd_no{
          odd.size() inside {[10:50]};
          //odd.value() inside {[1:100]};
          foreach(odd[i])
          {
            odd[i]inside {[1:100]};
            odd[i]%2==1;}
            
        }
        function void post_randomize();
      	no=no/10.0;
      $display("te value of of no %f",no);
          if(Q.size()>6)
            Q.pop_back();
          else
           Q.push_front(no_repeat5);
            
          if(index>5)
            begin
              index=0;
              old[index]=no_repeat5;
              ++index;
            end
          else
 			begin
              old[index]=no_repeat5;
              ++index;
            end
          if(datax==ZERO)
           a_res = 0;
          else if(datax==ONE)
            a_res=1;
          else if(datax==X)
            a_res='x;
          else if(datax==Z)
            a_res='z;
            
          
          
           
      endfunction
        
        endclass;
          int sum2=0;
          int sum3=0;
      RC obj;
      
      initial begin 
        obj=new();
        //for(int i =0 ;i<100;i++);
        obj.randomize;
        //foreach(obj.arry[i])
        $display("%0p",obj.arry);
        $display("%d",obj.no);
        $display("%d",obj.div5);
        $display("%0p",obj.odd);
        $display("%0p",obj.val);
        $display("prev %b nxt %b",obj.pre,obj.nxt);
//          for(int i =0 ;i<100;i++)
//          begin  
//         //$display("no repeat %d",obj.no_repeat5);
//          obj.randomize;
//            $display("%0b",obj.a_res);
//          end
        
        $display("%0p  %d",obj.array1,obj.array1.sum);
        obj.randomize() with {array2.sum<100;array3.sum>200;};
        foreach(obj.array2[i])
          sum2+=obj.array2[i];
        foreach(obj.array3[i])
          sum3+=obj.array3[i];
        for(int i =0;i<40;i++)
          begin
            obj.randomize;
         	$display("gen1  %d",obj.gen1);
       
         end
                

        
        $display("%0p  %d",obj.array2,obj.array2.sum);
        $display( "sum of array2 %d",sum2);
        
        $display("%0p  %d",obj.array3,obj.array3.sum);
        $display( "sum of array3 %d",sum3);
        
        $display("%0p  %d",obj.array2,obj.array2.sum);
        
        
        
        
        
        
        
       
        
       // $display("%p",obj.diff);
        
      end
      endmodule
