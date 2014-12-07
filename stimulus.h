#include <systemc.h>
#include <iostream>
#include <fstream> 
#include <string>

SC_MODULE( stimulus ){
  sc_in<bool> 	clk;				// template for port declearation
  sc_in<bool> 	rst;
  sc_out< sc_int<32> > addr;
  sc_out<bool> 	mode;				// Write --> 1 ; Read --> 0;
  
  std::ifstream ifs;
   
  std::string line;

  void stimulus_main();				
  void stimulus_init(void);

  SC_CTOR( stimulus ){				// SystemC constructor
    SC_CTHREAD( stimulus_main, clk.pos() );	// Declear a clock thread stimulus_main sensitive to positive edge of clk signal
    reset_signal_is( rst, false); 		// Declear a reset signal rst; reset is asserted when signal is low ( false )
						// In order to associate this reset to this clock thread, the reset_signal_is keyword has to follow
						// SC_CTHREAD declearation immediately. 
   
    SC_THREAD( stimulus_init); 
  } 

};
