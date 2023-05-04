class LOG;
time s_time;
static int tr_count;
static time total_time;

function void start();
s_time=$time;
endfunction


function void stop();
time delay = s_time -$time;
tr_count++;
 total_time+=delay;
endfunction

function void display_log();
$display("module instances % times" ,tr_count);
$display("total time spent % times" ,total_time);
endfunction
endclass

class Transmit;

bit[7:0] addr,csm,data;
LOG log;

function new();
log =new();
endfunction

task transmit_packet;
log.start();
$display("the value start time %0t ",log.s_time);
#50;
log.stop();
$display("the value stop time %0t ",log.s_time);
endtask

endclass



module class5;


Transmit t1;
initial begin
t1=new();
t1.transmit_packet();
$display("the total time elapsed %t" LOG ::total_time);
t1.log.display_log();

end
endmodule






 
