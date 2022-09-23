`timescale 1ns/1ns

module test;

   wire clk;
   reg rst_n;
   //logic width=5
   //reg alw_high_sig;
reg [1:0] count, start_s, next_s, sig_1;

	// logic wr_val, wr_done;
	 logic [1:0] arb_gnt_vec;

   // Check wr_val is not same as wr_done
   /*ovl_no_transition no_trans ( 
			     .clock     (clk),
			     .reset     (rst_n), 
			     .enable    (1'b1),
			     .test_expr (count),
			     .start_state(start_s),
			     .next_state(next_s)
			     );
*/
   // use function
 /* ovl_no_transition u_ovl_a_fn ( 
			     .clock     (clk),
			     .reset     (rst_n), 
			     .enable    (1'b1),
			     .test_expr ( ($countones (arb_gnt_vec) <= 1))
			     );
*/

ovl_no_transition signal(.clock(clk),.reset(rst_n),.enable(1'b1),.test_expr(sig_1),.start_state(start_s),.next_state(next_s));
   initial begin
      // Dump waves
      $dumpfile("dump_fail.vcd");
      $dumpvars(1, test);

      // Initialize values.
      		/*	rst_n = 0;
			arb_gnt_vec = 0;
			start_s = 2'b11;
			next_s =2'b00 ;
			count=2'b00;

      $display("ovl_always does not fire at rst_n");
      wait_clks(1);

      rst_n = 1;
     // wait_clks(1);
      $display("Out of reset");

      count = 2'b00;
wait_clks(1);
	count=start_s;
wait_clks(3);
	count=next_s;

wait_clks(10);

	#150$finish;  */

       rst_n=0;
       sig_1=2'b00;
	//start_s=2'b11;
	//next_s=2'b00;
       $display("ovl no transition ");
       sig_1=2'b11;
       wait_clks(5);
       rst_n=1;
       wait_clks(5);
       sig_1=2'b00;
       wait_clks(10);
       $finish;
   end

   task wait_clks (input int num_clks = 1);
      repeat (num_clks) @(posedge clk);
   endtask : wait_clks

  ivl_uvm_ovl_clk_gen #(.FREQ_IN_MHZ(100)) u_clk_100 (clk);

endmodule




