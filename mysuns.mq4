//+------------------------------------------------------------------+
//|                                                       mysuns.mq4 |
//|                                  Copyright 2018, Gustavo Carmona |
//|                                           http://www.awtt.com.ar |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, Gustavo Carmona"
#property link      "http://www.awtt.com.ar"
#property version   "1.00"
#property strict

#include "mysuns.mqh"

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   int candleLow, candleHigh;
   setLabel("Nuevo Texto \n nueva linea");
   candleLow = setSun("low",60,0); //setSun("low",0); 0=from candle
   drawArrow("low",candleLow);
   candleHigh = setSun("high",60,0);
   drawArrow("high",candleHigh);
   
   for(int z=0;z<200;z++){
      candleHigh = setSun("high",60,candleHigh+1);
      drawArrow("high",candleHigh);   
      }
    
    for(int z=0;z<200;z++){
      candleLow = setSun("low",60,candleLow+1);
      drawArrow("low",candleLow);   
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
