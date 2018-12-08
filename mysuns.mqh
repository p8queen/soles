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
   
 void drawArrowUP(string name, int candle){
  datetime x = Time[candle];
  double y = iHigh(Symbol(),0,candle) + 100*Point;
  ObjectDelete(0,name);
   ObjectCreate(0,name, OBJ_ARROW, 0, x, y );
   ObjectSet(name,OBJPROP_ARROWCODE,SYMBOL_ARROWUP);
   ObjectSet(name,OBJPROP_STYLE, STYLE_DASHDOT);
   ObjectSet(name,OBJPROP_COLOR,clrWhite);
   ObjectSet(name,OBJPROP_WIDTH,2);
   
 
 
   }
   
   