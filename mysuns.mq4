//+------------------------------------------------------------------+
//|                                                       mysuns.mq4 |
//|                                  Copyright 2018, Gustavo Carmona |
//|                                           http://www.awtt.com.ar |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, Gustavo Carmona"
#property link      "http://www.awtt.com.ar"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   double val, rsi;
   for(int z=0;z<200;z++){
      val=iCustom(Symbol(),0,"mysuns",0,z);
      rsi=iRSI(Symbol(),0,14,PRICE_CLOSE,z);
      if(val>0) Print("val: ",val," z: ",z, ", RSI: ", NormalizeDouble(rsi,2));
      }
      

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
   
  }
//+------------------------------------------------------------------+
