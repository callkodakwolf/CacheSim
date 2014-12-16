#include "stimulus.h"

void stimulus::stimulus_main(void){

    if( ifs.is_open() )
    {
      if( getline( ifs, line) )
      {
        
       std::cout << sc_time_stamp() << "\t"<<line << std::endl;
      }
      else 
        ifs.close();
    } 
    else {
      std::cout << " file closed " << endl;
      sc_stop();
    }
   wait();   
}

void stimulus::stimulus_init(void){
  
  ifs.open("go_trace.txt", std::ifstream::in);
  
}
