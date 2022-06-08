//+------------------------------------------------------------------+
//|                                                       Neuron.mqh |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

class Neuron 
  {
private:


public:

int layer_index;
double bias;
double sum;
double inputs[];
double weights[];
double delta_weigths[];
double reward;
double out;


void SetNeuronParamter(int &y_sizes[],int index){

   bias = 1;

   int sz = ArraySize(y_sizes);
   
   if(index > sz){
   
   Print("ueeeeepa");
   return;}

   layer_index = index;

   if(index == 0){
   ArrayResize(weights,y_sizes[index]);
   ArrayResize(inputs,y_sizes[index]);
   
   Print("layer:", index," weights size: ",ArraySize(weights));
   
   }
   
   if(index > 0){
   ArrayResize(weights,y_sizes[index-1]);
   ArrayResize(inputs,y_sizes[index-1]);
   
   Print("layer:", index," weights size: ",ArraySize(weights));
      
   }
}
void SetWeight(double value,int index){weights[index] = value;}
void SetInput(double value,int index){inputs[index] = value;}

void SetWeight(double &value[]){
   int array_sz = ArraySize(value);

   for(int i=0;i>array_sz;i++){
      weights[i] = value[i];}
      }
      
void SetInput(double &value[]){
   int array_sz = ArraySize(value);

   for(int i=0;i>array_sz;i++){
      inputs[i] = value[i];      
      }
 
   }
   
   
double CalculateOut(){

   sum = 0;
   
   int lyr_size = ArraySize(inputs);
   
  if(layer_index>0){
  
   for(int i=0;i<lyr_size;i++){     
    
      sum = sum + inputs[i]*weights[i];  
   }
      out = MathAbs(sum) + bias;
     }   
   return out;
}

                     Neuron();
                    ~Neuron();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Neuron::Neuron()
  {
  
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Neuron::~Neuron()
  {
  }
//+------------------------------------------------------------------+
