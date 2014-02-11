var baloonArrayStage0 = new Array();
var baloonArrayStage1 = new Array();
var baloonArrayStage2 = new Array();
var baloonArrayStage3 = new Array();
var baloonArrayStage4 = new Array();
var baloonArrayStage5 = new Array();



function  getBaloons(stage)
{
    switch (stage)
    {
         case 0 :
         {
            return baloonArrayStage0;
            break;
         }

         case 1 :
         {
            return baloonArrayStage1;
            break;
         }

         case 2 :
         {
            return baloonArrayStage2;
            break;
         }

         case 3 :
         {
            return baloonArrayStage3;
            break;
         }

         case 4 :
         {
            return baloonArrayStage4;
            break;
         }

         case 5 :
         {
            return baloonArrayStage5;
            break;
         }
    }
}

function addBallons( stage,item )
{
    switch (stage)
    {
         case 0 :
         {
            baloonArrayStage0.push(item)
            break;
         }

         case 1 :
         {
            baloonArrayStage1.push(item)
            break;
         }
         case 2 :
         {
            baloonArrayStage2.push(item)
            break;
         }
         case 3 :
         {
            baloonArrayStage3.push(item)
            break;
         }
         case 4 :
         {
            baloonArrayStage4.push(item)
            break;
         }
         case 5 :
         {            
            baloonArrayStage5.push(item)
            break;
         }
    }

}


