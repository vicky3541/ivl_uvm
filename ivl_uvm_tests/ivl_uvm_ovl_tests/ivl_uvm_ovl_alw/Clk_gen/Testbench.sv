// Code your testbench here
// or browse Examples
module tb;
  wire clk1;
  wire clk2;
  wire clk3;
  wire clk4, clk5;
  //wire clk6, clk7;
  reg enable;
  reg [7:0] y;
  
   ivl_uvm_ovl_clk_gen u0( clk1);
  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(100)) u1(clk2);
  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(10)) u2(clk3); 
  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(1000)) u3(clk4);
  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(10000)) u4(clk5);
 // ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(.001)) u5(enable,clk6);
 // ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(.1)) u6(enable,clk7);
  
  initial begin
    enable <= 0;
    for (int i=0; i<10; i= i+1)
      begin
        y = $random;
        #(y) enable <= ~enable;
        $display("i=%0d y =%0d", i, y);
        
        #100;
      end
    #100 $finish;
  end
endmodule
    
  
 
