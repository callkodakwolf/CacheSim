#include <systemc.h>
#include <stimulus.h>

SC_MODULE( cachesim_top ){
  //Module declearation
  stimulus 	*stimulus0;  
  
  // Local signal declearation
  sc_signal<bool> 	rst_sig; 		// template for signal decleration
  sc_signal< sc_int<32> > addr_sig;	
  sc_signal< bool > mode_sig;		

  sc_clock 	clk_sig;			// sc_clock is a class for clk signal  

  SC_CTOR( cachesim_top )
    :clk_sig("clk_sig",10,SC_NS)// parameterize clock signal
  {
    stimulus0 = new stimulus("memory_trace_input");
    stimulus0->clk(clk_sig);
    stimulus0->rst( rst_sig);
    stimulus0->addr( addr_sig);
    stimulus0->mode( mode_sig);
  }

  ~cachesim_top(){
    delete stimulus0;
  }

};

cachesim_top *top = NULL;

int sc_main( int argc, char* argv[])
{
  top = new cachesim_top( "cache_simulator");
  std::cout << "Next step: start sc simulation" <<std::endl;
  sc_start();
  return 0;

}
