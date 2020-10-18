#include "data_processor.hpp"
#include <stdexcept>

using namespace std;

template <typename Tin, typename Tout>
void DataProcessor<Tin, Tout>::process( BufferedMessage<Tin> &msgIn, BufferedMessage<Tout> &msgOut){
}

