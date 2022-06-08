//+------------------------------------------------------------------+
//|                                                       Layers.mqh |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include "CNeuron.mqh"

class CLayers
  {
private:

int index;
int y_sizes[];
int this_size;

double layer_outputs[];

public:

Neuron neurons[];

void CreateNeurons(int &sizes[], int positon){

    this_size = sizes[positon];

    ArrayResize(neurons,this_size);
    
    for(int i=0;i<this_size;i++){
    
    neurons[i].SetNeuronParamter(sizes,positon);
    
    }


}
                     CLayers();
                    ~CLayers();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CLayers::CLayers()
  {
    
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CLayers::~CLayers()
  {
  }
//+------------------------------------------------------------------+
