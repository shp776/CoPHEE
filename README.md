# CoPHEE
CoPHEE is a Co-processor for Partially Homomorphic Encrypted Encryption. CoPHEE assists the host processor with the calculation of big number modular arithmetic like modular multiplication, modular exponentiation, and modular inverse, for operand size 64-bit to 2048-bit. In addition, it calculates the greatest common divisor (GCD) of two numbers and generates random numbers. The host processor communicates with CoPHEE through an UART interface. CoPHEE has been fabricated in ASIC (65 nm Globalfoundry LPe process) and a 512-bit version has also been loaded on an FPGA (Nexys-4 DDR).

Copyright (c) 2019 Michail Maniatakos, New York University Abu Dhabi, https://wp.nyu.edu/momalab/

# Cite us!
If you find our work useful, please cite our publication [(author's version pdf)](http://sites.nyuad.nyu.edu/moma/pdfs/pubs/C42.pdf):
 
    M. Nabeel, M. Ashraf, E. Chielle, N.G. Tsoutsos, and M. Maniatakos.
    “CoPHEE: Co-processor for Partially Homomorphic Encrypted Execution”. 
    In: IEEE Hardware-Oriented Security and Trust (HOST), 2019. 

# Request a copy of CoPHEE
A limited number of fabricated ASICs of CoPHEE can be sent to researchers. Please [e-mail the MoMA Lab director](mailto:michail.maniatakos+cophee@nyu.edu) with a request.

# Technical report for CoPHEE
A technical report detailing the design and fabrication process for CoPHEE can be found [here](http://sites.nyuad.nyu.edu/moma/pdfs/pubs/CoPHEE_Technical_Report.pdf).

# RTL files description

All the RTL directories are present under:
https://github.com/momalab/CoPHEE/tree/master/modules 

Final Set of RTL Files:

  #Chip Top File
  ./modules/ccs0101/rtl/ccs0101.v
  ./modules/ccs0101/rtl/ccs0101_define.v

  #Chip IO File
  ./modules/padring/rtl/padring.v

  #Chip Core File
  ./modules/chip_core/rtl/chip_core.v

  #Bus Matrix
  ./modules/ahb_ic/rtl/ahb_ic.v

  #Uart Master
  ./modules/uartm/rtl/uartm.v
  ./modules/uartm/rtl/uartm_ahb.v
  ./modules/uartm/rtl/uartm_rx.v
  ./modules/uartm/rtl/uartm_tx.v

  #Chip Configuration Space
  ./modules/gpcfg/rtl/gpcfg_rd.v
  ./modules/gpcfg/rtl/gpcfg_rd_wr.v
  ./modules/gpcfg/rtl/gpcfg_rd_wr_p.v
  ./modules/gpcfg/rtl/hw_rng_fsm.v
  ./modules/gpcfg/rtl/gpcfg.v

  #Modular Interleaved Multiplier
  ./modules/crypto_lib/rtl/mod_mul_il.v

  #Montgomery Multiplier
  ./modules/crypto_lib/rtl/montgomery_to_conv.v
  ./modules/crypto_lib/rtl/montgomery_mul.v
  ./modules/crypto_lib/rtl/montgomery_from_conv.v

  #Modular Inverse/Binary Exended GCD
  ./modules/crypto_lib/rtl/bin_ext_gcd.v

  #Modular Exponentiation
  ./modules/gpcfg/rtl/mod_exp.v

  #TRNG
  ./modules/crypto_lib/rtl/trng_wrap.v
  ./modules/crypto_lib/rtl/trng.v
  ./modules/crypto_lib/rtl/random_num_gen.v
  ./modules/crypto_lib/rtl/vn_corrector.v

  #UART SLAVE
  ./modules/uarts/rtl/uarts.v
  ./modules/uarts/rtl/uarts_tx.v
  ./modules/uarts/rtl/uarts_rx.v

  #Technology Library Cells directly used in ./modules/chip_core/rtl/chip_core.v 
  ./modules/chiplib/rtl/chiplib.v
  ./modules/padring/rtl/rgo_csm65_25v33_50.v

  #GPIO
  ./modules/gpio/rtl/gpio.v

  #Top Level Test Bench
  ./modules/ccs0101/verif/ccs0101_tb.v
  ./modules/ccs0101/verif/pad_model.v
  ./modules/ccs0101/verif/padring_tb.v
  
  #Include directories/Search path needed for compilation
  +incdir+./design/modules/uartm/rtl
  +incdir+./design/modules/uarts/rtl
  +incdir+./design/modules/gpcfg/rtl

  #Sample Simulation Script
  ./modules/ccs0101/verif/run_test.sh

