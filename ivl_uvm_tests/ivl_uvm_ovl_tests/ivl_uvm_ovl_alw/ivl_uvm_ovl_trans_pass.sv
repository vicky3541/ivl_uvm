`timescale 1ns/1ns

module test;

   wire clk;
   reg rst_n;
  // reg alw_high_sig;
   reg [1:0] count,start_s,next_s;
   
	// logic wr_val, wr_done;
	 logic [1:0] arb_gnt_vec;

   // Check wr_val is not same as wr_done
   ovl_transition trans ( 
			     .clock     (clk),
			     .reset     (rst_n), 
			     .enable    (1'b1),
			     .test_expr (count),
				 .start_state (start_s),
				 .next_state (next_s)
			     );

   // simple signal check OVL 
   ovl_always u_ovl_always ( 
			     .clock     (clk),
			     .reset     (rst_n), 
			     .enable    (1'b1),
			     .test_expr (alw_high_sig)
			     );

   // use function
   /*ovl_transition u_ovl_a_fn ( 
			     .clock     (clk),
			     .reset     (rst_n), 
			     .enable    (1'b1),
			     .test_expr ( ($countones (arb_gnt_vec) <= 1))
			     );*/

   initial begin
      // Dump waves
      $dumpfile("dump.vcd");
      $dumpvars(1, test);

      // Initialize values.
      rst_n = 0;
      arb_gnt_vec = 0;
			start_s = 2'b00;
			next_s = 2'b11;
			count = 2'b00;
			
      $display("ovl_always does not fire at rst_n");
      wait_clks(1);

      rst_n = 1;
      wait_clks(1);
      $display("Out of reset");
	  
	count = 2'b00;
		wait_clks(1);
	count=2'b10;
		wait_clks(1);
	count=start_s;
		wait_clks(3);
	count=2'b01;
		wait_clks(10);

	#150$finish;
   end

   task wait_clks (input int num_clks = 1);
      repeat (num_clks) @(posedge clk);
   endtask : wait_clks

  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(100)) u_clk_100 (clk);

endmodule
  
