//+------------------------------------------------------------------+
//|                                                    NeuralNet.mqh |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include "Layers.mqh"

class NeuralNet 
  {
private:

double temp_out[];
int y_size[];
int net_size;
CLayers layer[];


public:
 
void OnStart(int &y_sizes[]){

  ArrayCopy(y_size,y_sizes);
  
  net_size = ArraySize(y_sizes);
  
  ArrayResize(layer,net_size);

//criando arrays de neuronios em cada camada da rede

  for (int i=0;i<net_size;i++){
  
    layer[i].CreateNeurons(y_size,i);
        
    Print("layer ",i," size: ",ArraySize(layer[i].neurons));
        
   }

// settando pesos aleatoriamente na inicializaçao
  for(int i=1; i<net_size;i++){
    for(int j=0;j<y_size[i];j++){
     for (int w=0;w<y_size[i-1];w++){
       
       double randw = MathRand();
      
       randw = randw/(5000 + MathAbs(randw));
       
       NormalizeDouble(randw,2);
       
       Print("layer: ",i ," neuronio: ",j," peso: ",w," vale: " ,randw);
             
       layer[i].neurons[j].SetWeight(randw, w);     
     }
    }
   }
  } 
  
  /////////////////////////////////////
  
//////propagação//////////////////////////
  
   void Propagate(double &inputs_array[]){
   
      ArrayResize(temp_out,y_size[0]);
      
         for(int n=0;n<y_size[0];n++){
         
             layer[0].neurons[n].out = inputs_array[n];
            
             Print("layer:  ",0,"  neuron:  ",n," out:  ", layer[0].neurons[n].out);
              
             temp_out[n]=layer[0].neurons[n].out;
         
         }
         
         for(int l=1;l<net_size;l++){                       //loop das camadas
            
            for(int n=0;n<y_size[l];n++){                     //loop pros neuronios atuais
            
               for(int i=0;i<y_size[l-1];i++){                //loop do tamanho dos inputs 
               
                Print("temp_out da camada anterior: ",i,": ",temp_out[i]);
               
                layer[l].neurons[n].SetInput(temp_out[i], i); //passando inputs pra cada neuronio
                
                Print("layer:  ",l,"  neuron:  ",n,"  weight: ", layer[l].neurons[n].weights[i]); 
                
                Print("layer:  ",l,"  neuron:  ",n,"  input: ", layer[l].neurons[n].inputs[i]); 
                
                } //nao precisamos mais saber o tamanho da camada anterior
               
                layer[l].neurons[n].CalculateOut();           //calculando a saida de cada neuronio
                
                Print("  layer:  ",l,"  neuron:  ",n,"  out:  ", layer[l].neurons[n].out);
                
                }
                
                //limpando e passando novos valores pra temp_out quando for pra proxima camada
                
                ArrayFree(temp_out);
                ArrayResize(temp_out,y_size[l]);         
            
            for(int n=0;n<y_size[l];n++){                     // essas operaçoes tem que ser feita depois de usar o array
            
                temp_out[n]=layer[l].neurons[n].out;          //atualizando os valores no array de outs
                  
                }
           
                //////////////////////////////so uns print 
              
               
                   for(int i=0;i<y_size[l];i++){
                 
                      Print("temp_out atualizado ",i,": ",temp_out[i]);
                 
                                 
            
             
           
         
          } 
        }    
   }
    
    
    
                NeuralNet();
                ~NeuralNet();
  };
NeuralNet::NeuralNet()
  {  
  }
NeuralNet::~NeuralNet()
  {
  }
