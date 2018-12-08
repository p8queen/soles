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

   setLabel("Nuevo Texto \n nueva linea");
   int a = 0, b=-1;
   int candle_index = -1;
   int iHighestCandle = -1;
   candle_index = iHighest(Symbol(),0,MODE_HIGH,62,a);
   while(a!=candle_index && a<500){
      a=candle_index;
      candle_index = iHighest(Symbol(),0,MODE_HIGH,62,a);
      }
   drawArrowUP("arrowup-0",a);
      
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
