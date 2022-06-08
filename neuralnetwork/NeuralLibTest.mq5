//+------------------------------------------------------------------+
//|                                                NeuralLibTest.mq5 |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include "NeuralNet.mqh"

double net_inputs[];
int net_size;

int ysize[] = {5,6,6,3};

NeuralNet network();

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   net_size = ArrayResize(net_inputs,ArraySize(ysize));
   
   network.OnStart(ysize);
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

CopyClose(_Symbol,0,0,ysize[0] + 1,net_inputs);

   network.Propagate(net_inputs);


   
  }
//+------------------------------------------------------------------+
