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
    
    constraint no_repeat_occr_5{
      diff.size() inside {[20:100]};
      foreach(diff[i]){
        !(no_repeat5 inside{Q});
        diff[i]== (!(no_repeat5 inside{Q}));
        
           }
    }
    
    
    
    constraint detain_prev{
    pre!=nxt;
      $countones(nxt)==5;
    }
    
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
    constraint c1{
      arry.size inside {[10:50]};
      foreach(arry[i]){
        if (i % 2 ==0)
          arry[i] ==0;
        else
          arry[i]== (i+1)/2;
      }
    }
        constraint oneto99{
          no inside {[990:1000]};
          
        }
        constraint div_by_five{
        div5>4;
          div5<100;//excluding zero
          div5%5==0;  
        }
        
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
          
          
           
      endfunction
        
        endclass;
      RC obj;
      
      initial begin 
        obj=new();
        obj.randomize;
        //foreach(obj.arry[i])
        $display("%0p",obj.arry);
        $display("%d",obj.no);
        $display("%d",obj.div5);
        $display("%0p",obj.odd);
        $display("%0p",obj.val);
        $display("prev %b nxt %b",obj.pre,obj.nxt);
        $display("no repeat %d",obj.no_repeat5);
        $display("%p",obj.diff);
        
      end
      endmodule
