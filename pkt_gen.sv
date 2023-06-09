// Code your testbench here
// or browse Examples
typedef enum logic[3:0] {IDLE='hf,SOF='h8,EOF='h1,DATA='h0} cntrl_e;
typedef enum logic[31:0] {IDLE_D='h70707070,SOF_D='hfb_B5_55_55,EOF_D='h957575FD} data_e;


class Packet;
  rand bit [3:0]cntrl;
  rand bit [31:0]data;
  logic[3:0]prev_cntrl;
  rand bit[4:0]len;
  int cnt;
  
  constraint c1 {
    len >10;
    
    if(prev_cntrl=='hf ||prev_cntrl=='h1){
      cntrl inside {'hf,'h8};
    }
      if(prev_cntrl =='h8){
      cntrl == 'h0;
      }
        if (prev_cntrl=='h0 && cnt<len){
        cntrl =='h0;
        }
          if(prev_cntrl=='h0 && cnt>=len){
        cntrl =='h1;
        }
//             if(prev_cntrl=='h1 ){
//         cntrl =='h1;
//         }
            
        cntrl ==SOF -> data==SOF_D;
    	cntrl ==EOF -> data==EOF_D;
    cntrl ==IDLE -> data==IDLE_D;
    cntrl == DATA -> data inside {['hfff:'hfffffff]};
    solve cntrl before data;
  }
 function new();
  	cntrl='hf;
    prev_cntrl='hf;
  endfunction
 
  function void post_randomize();
    prev_cntrl=cntrl;
    cnt= cntrl==DATA? ++cnt:0;
    endfunction
  
endclass

module pkt_gen;
  bit [31:0][3:0]cntrl;
  bit [31:0][31:0]data;
  cntrl_e [31:0] txc;
  data_e [31:0]txd;
  
  bit[4:0]len;
  
  logic clk=0;
  
  always #5 clk=~clk;
  
  always @(posedge clk)
  	begin
     // p1.randomize;
      for(int i =0 ;i<32 ;i++)
        begin
      	 p1.randomize;
          cntrl[i]<=p1.cntrl;
          data[i]=p1.data;
          txc[i]=p1.cntrl;
          txd[i]=p1.data;
        end
      //$cast(txc,p1.cntrl);
      //$cast(txd,p1.data);
      ///txd<=p1.data;
      //data=p1.data;   
      // cntrl<=p1.cntrl;
          
      //data<=p1.data;
      len<=p1.len;
      
     // $display("pkt len %d",len);
     // $display("the TXC %s and  data %h",txc.name(),txd);
      //$display("the TXC %h and  data %h",cntrl,data);
  
    end
  
  Packet p1;
  initial begin
     $dumpfile("dump.vcd");
    $dumpvars(1,pkt_gen);
        
    p1=new();
    repeat(100) @(posedge clk);
    $stop();
  
  end
  
  
endmodule
 
