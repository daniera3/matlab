function result=chackpass(value)
load('pass.mat','userInput1');
if string(value)==string(userInput1)
    result=true;
else
    result=false;
    
end