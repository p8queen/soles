//+------------------------------------------------------------------+
//|                                                       mysuns.mqh |
//|                                  Copyright 2018, Gustavo Carmona |
//|                                           http://www.awtt.com.ar |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, Gustavo Carmona"
#property link      "http://www.awtt.com.ar"
#property version   "1.00"
#property strict

void setLabel(string texto){
   ObjectCreate("my-label", OBJ_TEXT,0,0,0);
   ObjectSetString(0,"my-label",OBJPROP_TEXT,texto);
      ObjectSet("my-label",OBJPROP_CORNER,1);
      ObjectSetInteger(0,"my-label",OBJPROP_XDISTANCE,30);
      ObjectSetInteger(0,"my-label",OBJPROP_YDISTANCE,50);
      ObjectSetInteger(0,"my-label",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"my-label",OBJPROP_FONTSIZE,12);

   }
   
 void drawArrow(string name="high or low", int candle=0){
  datetime x = Time[candle];
  int symbolArrow;
  double y;
  
  if(name=="high"){
   name = "arrowUP-"+IntegerToString(candle);
   symbolArrow = SYMBOL_ARROWUP; 
   y = iHigh(Symbol(),0,candle) + 2*Point;
   }
  else{
   symbolArrow = SYMBOL_ARROWDOWN; 
   name = "arrowDOWN-"+IntegerToString(candle);
   y = iLow(Symbol(),0,candle) - 2*Point;
   }
   ObjectDelete(0,name);
   ObjectCreate(0,name, OBJ_ARROW, 0, x, y );
   ObjectSet(name,OBJPROP_ARROWCODE,symbolArrow);
   ObjectSet(name,OBJPROP_STYLE, STYLE_DASHDOT);
   ObjectSet(name,OBJPROP_COLOR,clrWhite);
   ObjectSet(name,OBJPROP_WIDTH,2);
   
 
 
   }
   
int setSun(string mode="high or low"){
   int a = 0;
   int candle_index = -1;
   int iHighestCandle = -1;
   
   if(mode=="high")
      candle_index = iHighest(Symbol(),0,MODE_HIGH,62,a);
   else
      candle_index = iLowest(Symbol(),0,MODE_LOW,62,a);
      
   while(a!=candle_index && a<500){
      a=candle_index;
      
      if(mode=="high")
      candle_index = iHighest(Symbol(),0,MODE_HIGH,62,a);
   else
      candle_index = iLowest(Symbol(),0,MODE_LOW,62,a);
      
      }
   
   return candle_index;
   }
   