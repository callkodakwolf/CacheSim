#include "stimulus.h"

void stimulus::stimulus_main(void){
  
    if(ifs.is_open() )
    {
      if( getline( ifs, line) )
      {
        
       std::cout << sc_time_stamp() <<  endl; 
       std::cout<< "\t"<<line << std::endl;
      }
      else 
        ifs.close();
    } 
    else std::cout << " file closed " << endl;
   wait();   
}

void stimulus::stimulus_init(void){
  ifs.open("go_trace.txt", std::ifstream::in);
}
