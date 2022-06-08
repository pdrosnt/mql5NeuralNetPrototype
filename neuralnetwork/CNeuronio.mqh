//+------------------------------------------------------------------+
//|                                                       Neuron.mqh |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

class CNeuron 
  {
private:


public:

int next_layer_size;
int previosly_layer_size;
int _layer_size;
double sum;
double inputs[];
double weights[];
double bias;

double out;


void GetInputs(double &previosly_layer_inputs[]){

  for (int i=0;i<previosly_layer_size;i++){inputs[i] = previosly_layer_inputs[i];}

}

void GetLayersSizes(int _previosly_layer_size,int layer_size,int _next_layer_size){

   ArrayResize(inputs,_previosly_layer_size);
   
   Print("size layer anterior:  ",_previosly_layer_size);
   
   ArrayResize(weights,_previosly_layer_size);

   _layer_size = layer_size;

}





double CalculateNeuron(){

   sum=0.0;
   
  Print("input: ",inputs[0],"  peso:  ",weights[0]);

   for(int w=0; w<previosly_layer_size; w++){
   
   Print("input: ",inputs[w],"  peso:  ",weights[w]);
   
   Print("sum:  ",sum);

   sum = sum + ( inputs[w] * weights[w] );
   }
   
   out = sum / (1+MathAbs(sum));
   
   
   
   return out;
}


                     CNeuron();
                    ~CNeuron();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CNeuron::CNeuron()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CNeuron::~CNeuron()
  {
  }
//+------------------------------------------------------------------+
