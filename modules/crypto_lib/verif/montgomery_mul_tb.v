/**********************************************************************************
    This module is part of the project CoPHEE.
    CoPHEE: A co-processor for partially homomorphic encrypted encryption
    Copyright (C) 2019  Michail Maniatakos
    New York University Abu Dhabi, wp.nyu.edu/momalab/

    If find any of our work useful, please cite our publication:
      M. Nabeel, M. Ashraf, E. Chielle, N.G. Tsoutsos, and M. Maniatakos.
      "CoPHEE: Co-processor for Partially Homomorphic Encrypted Execution". 
      In: IEEE Hardware-Oriented Security and Trust (HOST). 

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
**********************************************************************************/


`timescale 1 ns/1 ps

module montgomery_mul_tb (
);

//---------------------------------
//Local param reg/wire declaration
//---------------------------------

localparam  CLK_PERIOD   = 4.167;   //24 Mhz

localparam  NBITS    = 2048;


reg              CLK; 
reg              nRESET; 
reg [NBITS-1 :0] a; 
reg [NBITS-1 :0] b; 
reg [NBITS-1 :0] m; 
reg [NBITS-1 :0] m_size; 
reg              enable_p; 

wire [NBITS-1 :0] y; 

integer no_of_clocks; 


//------------------------------
//Clock and Reset generation
//------------------------------

initial begin
  CLK      = 1'b0; 
end

always begin
  #(CLK_PERIOD/2) CLK = ~CLK; 
end



initial begin
   nRESET   = 1'b1;
   enable_p = 1'b0;
   m        = 2048'd0;
   a        = 2048'd0;
   b        = 2048'd0;
   m_size   = 11'd2047;
  repeat (2) begin
    @(posedge CLK);
  end
   nRESET    = 1'b0;

  repeat (2) begin
    @(posedge CLK);
  end
  nRESET   = 1'b1;

  repeat (2) begin
    @(posedge CLK);
  end
  #1
  enable_p = 1'b1;
  m        = 2048'd72639;
  a        = 2048'd5792;
  b        = 2048'd1229;
  m_size   = 11'd17;
  @(posedge CLK);
  #1
  enable_p = 1'b0;

end



//------------------------------
//DUT
//------------------------------
montgomery_mul #(
  .NBITS (NBITS)
 ) u_dut_inst   (
  .clk           (CLK),
  .rst_n         (nRESET),
  .enable_p      (enable_p),
  .a             (a),
  .b             (b),
  .m             (m),
  .m_size        (m_size),
  .y             (y),
  .done_irq_p    (done_irq_p)
);


//------------------------------
//Track number of clocks
//------------------------------
initial begin
  no_of_clocks = 0; 
end
always@(posedge CLK)  begin
  no_of_clocks = no_of_clocks +1 ; 
  //$display($time, " << Number of Clocks value         %d", no_of_clocks);
  //$display($time, " << htrans_m[0] value              %b", ccs0001_tb.u_dut_inst.u_chip_core_inst.u_ahb_ic_inst.htrans_m[0][1]);
  //$display($time, " << vlaid_trans_s_by_m[s][0] value %b", ccs0001_tb.u_dut_inst.u_chip_core_inst.u_ahb_ic_inst.vlaid_trans_s_by_m[0][0]);
  //$display($time, " << vlaid_trans_s_by_m[s][1] value %b", ccs0001_tb.u_dut_inst.u_chip_core_inst.u_ahb_ic_inst.vlaid_trans_s_by_m[1][0]);
  //$display($time, " << SLAVE_BASE[0] value            %h", ccs0001_tb.u_dut_inst.u_chip_core_inst.u_ahb_ic_inst.SLAVE_BASE[0][31:16]);
  //$display($time, " << SLAVE_BASE[1] value            %h", ccs0001_tb.u_dut_inst.u_chip_core_inst.u_ahb_ic_inst.SLAVE_BASE[1][31:16]);
  //$display($time, " << haddr_m[0]  value              %h", ccs0001_tb.u_dut_inst.u_chip_core_inst.u_ahb_ic_inst.haddr_m[0][31:16]);
  //$display($time, " << memory dump              %h", ccs0001_tb.u_dut_inst.u_chip_core_inst.u_sram_wrap_inst.u_sram_inst.mem[0]);
end

endmodule
