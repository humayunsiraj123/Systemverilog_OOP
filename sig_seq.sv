// Code your testbench here
// or browse Examplesty
typedef enum logic [3:0] {IDLE='hf,SOF='h8,DATA='h0,EOF='h1} cntrl_e;
typedef enum logic [31:0] {IDLE_D='h70707007,SOF_D='hFB_B5_55_55,EOF_D='h957575FD} data_e;

class Sig_seq;
  rand bit [3:0]cntrl;
  rand bit [31:0]data;
  bit[3:0] prev_cntrl;
   rand bit [4:0] len;
  int cnt;
  constraint c1{
    
    if(prev_cntrl == 'hf||prev_cntrl == 'h1){
      cntrl inside {'hf,'h8};
    }
      if(prev_cntrl == 'h8){
      cntrl =='h0;
      }
        if(prev_cntrl =='h0 && cnt<'h10){
      	cntrl=='h0;  
        }
          if(prev_cntrl =='h0 && cnt>'h10){
          cntrl=='h1;
          }
          cntrl ==SOF->data==SOF_D;
    	  cntrl ==EOF->data==EOF_D;
    	  cntrl ==IDLE->data==IDLE_D;
    cntrl ==DATA->data inside {'haaaaa,'hffffff};
    	 solve cntrl before data;
          
          }
  
             function void post_randomize();
    cnt=(prev_cntrl==DATA)?++cnt:0;
    prev_cntrl=cntrl;
    endfunction
    
    function new();
    this.prev_cntrl='hf;
    this.cntrl='hf;  
    endfunction
    endclass
    
    module tb_sig_seq();
    
bit [3:0]cntrl;
  bit [31:0]data;
  bit[3:0] prev_cntrl;
  bit [4:0] len;
  cntrl_e CNTRL;
  data_e  DATA;
      
      logic clk=0;
      Sig_seq  ss;
      
      always #5 clk=~clk;
      
      
      initial begin
        ss= new();
        $dumpfile("dump.vcd");
        $dumpvars(1,tb_sig_seq);
        
        
        
        repeat(100) @(posedge clk);
          $stop(); 
      end
      
      always @(posedge clk)
        begin 
          ss.randomize();
        cntrl=ss.cntrl;
          data=ss.data;
   prev_cntrl=ss.prev_cntrl;
 len=ss.len;
  // CNTRL=ss.cntrl;
  //DATA=ss.data;
         
          $display("the value of cntrl %h  data %h",cntrl,data);
        
        
        
        
        end
      
    endmodule
