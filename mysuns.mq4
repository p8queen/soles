//+------------------------------------------------------------------+
//|                                                       mysuns.mq4 |
//|                                  Copyright 2018, Gustavo Carmona |
//|                                           http://www.awtt.com.ar |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, Gustavo Carmona"
#property link      "http://www.awtt.com.ar"
#property version   "1.00"
#property strict

double valMin, valMax, lastPriceMax, lastPriceMin, ema, balance, lotaje;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   lastPriceMax =100;
   lastPriceMin =0;
   lotaje = 0.01;
   balance = AccountEquity();
        

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
   valMin=iCustom(Symbol(),0,"mysuns",1,1);
   valMax = iCustom(Symbol(),0,"mysuns",0,1);
   ema = iMA(Symbol(),0,200,1,MODE_EMA,PRICE_CLOSE,1);
   
   //if(valMin>0 && Bid<ema && Ask<lastPriceMax-500*Point){
   //      //oJO!!! pasar 1 lote a 0.01 en tickmill
   //   OrderSend(Symbol(),OP_BUY,lotaje,Ask,10,0,0);
   //   lastPriceMax = Ask;   
   //   }
    
    if(OrdersTotal()>=2)
      lotaje = 0.02;
    
    if(valMax>0 && Bid>ema && Bid>lastPriceMin+500*Point){
         //oJO!!! pasar 1 lote a 0.01 en tickmill
      OrderSend(Symbol(),OP_SELL,lotaje,Bid,10,0,0);
      lastPriceMin = Ask;   
      }
        
    if(OrdersTotal()>0 && valMax>0 && AccountEquity()>=AccountBalance()+3){
      close();
      lotaje = 0.01;
      }
      if(OrdersTotal()>0 && valMin>0 && AccountEquity()>=AccountBalance()+3){
      close();
      lotaje = 0.01;
      }
    if(valMax>0)
      lastPriceMax = valMax;
    if(valMin>0)
      lastPriceMin = valMin;
      
  }
//+------------------------------------------------------------------+

void close(){
   int a=OrdersTotal()-1;
      while(a>=0){
      
         if(OrderSelect(a,SELECT_BY_POS)){
            
                         
               if(OrderType()==OP_SELL)
                  OrderClose(OrderTicket(),OrderLots(),Ask,10);
               
               if(OrderType()==OP_BUY)
                  OrderClose(OrderTicket(),OrderLots(),Bid,10);
                  
                }
                a--;
                  }
}