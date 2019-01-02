classdef Test1 < matlab.unittest.TestCase
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
         import matlab.unittest.TestSuite;
         
    end
   
    methods (Test)
        function TestSizePicTrue(testCase)
            ImagePixel = SizeInPixels('3.jpg');
            actSolution =ImagePixel;
            expSolution = 30121;
            testCase.verifyEqual(actSolution,expSolution,'testin applesize==30121 True');
        end
         function TestSizePicFalse(testCase)
            ImagePixel = SizeInPixels('4.jpg');
            actSolution =ImagePixel;
            expSolution = 30121;
            testCase.verifyNotEqual(actSolution,expSolution,'testin bannasize==30121 False');    
         end
         function TestdiamitarPicTrue(testCase)
             ImagePixel = Diameter('3.jpg');
             actSolution =floor(ImagePixel);
             expSolution = floor(1.590909090909091);
             testCase.verifyEqual(actSolution,expSolution,'testin bannasize==30121 False');  
         end
          function TestdiamitarPicFalse(testCase)
             ImagePixel = Diameter('3.jpg');
             actSolution =floor(ImagePixel);
             expSolution = 0;
             testCase.verifyNotEqual(actSolution,expSolution,'testin bannasize==30121 False');  
         end
            function TestLineMangerPass(testCase)
            load('pass.mat','userInput1');
            realSolution=chackpass(userInput1);
            ExeptedSolution=true;
            testCase.verifyEqual(realSolution,ExeptedSolution,'Line manger test true');
        end
        function TestLineMangerWrong(testCase)
            load('pass.mat','userInput1');
            temp=[userInput1,'1'];
            realSolution=chackpass(temp);
            ExeptedSolution=false;
            testCase.verifyEqual(realSolution,ExeptedSolution,'Line manger test false');
        end

        
    end
end