% Demo macro to very, very simple color detection in 
% HSV (Hue, Saturation, Value) color space.
% Requires the Image Processing Toolbox.  Developed under MATLAB R2014a.
%
function maskedRGBImage=SimpleColorDetectionByHue()

    load('img.mat', 'fullImageFileName');
	% Read in image into an array.
	[rgbImage, storedColorMap] = imread(fullImageFileName); 
	[rows, columns, numberOfColorBands] = size(rgbImage);
	% If it's monochrome (indexed), convert it to color. 
	% Check to see if it's an 8-bit image needed later for scaling).
	if strcmpi(class(rgbImage), 'uint8')
		% Flag for 256 gray levels.
		eightBit = true;
	else
		eightBit = false;
	end
	if numberOfColorBands == 1
		if isempty(storedColorMap)
			% Just a simple gray level image, not indexed with a stored color map.
			% Create a 3D true color image where we copy the monochrome image into all 3 (R, G, & B) color planes.
			rgbImage = cat(3, rgbImage, rgbImage, rgbImage);
		else
			% It's an indexed image.
			rgbImage = ind2rgb(rgbImage, storedColorMap);
			% ind2rgb() will convert it to double and normalize it to the range 0-1.
			% Convert back to uint8 in the range 0-255, if needed.
			if eightBit
				rgbImage = uint8(255 * rgbImage);
			end
		end
	end 
	
	% Display the original image.
    rgbImage=imresize(rgbImage,[280 280]);
	% Convert RGB image to HSV
	hsvImage = rgb2hsv(rgbImage);
	% Extract out the H, S, and V images individually
    
	hImage = hsvImage(:,:,1);
	sImage = hsvImage(:,:,2);
	vImage = hsvImage(:,:,3);
	
		[hueThresholdLow, hueThresholdHigh, saturationThresholdLow, saturationThresholdHigh, valueThresholdLow, valueThresholdHigh] = SetThresholds();
	
	% Interactively and visually set/adjust thresholds using custom thresholding application.
	% Available on the File Exchange: http://www.mathworks.com/matlabcentral/fileexchange/29372-thresholding-an-image
% 	[hueThresholdLow, hueThresholdHigh] = threshold(hueThresholdLow, hueThresholdHigh, hImage);
% 	[saturationThresholdLow, saturationThresholdHigh] = threshold(saturationThresholdLow, saturationThresholdHigh, sImage);
% 	[valueThresholdLow, valueThresholdHigh] = threshold(valueThresholdLow, valueThresholdHigh, vImage);


	% Now apply each color band's particular thresholds to the color band
	hueMask = (hImage >= hueThresholdLow) & (hImage <= hueThresholdHigh);
	saturationMask = (sImage >= saturationThresholdLow) & (sImage <= saturationThresholdHigh);
	valueMask = (vImage >= valueThresholdLow) & (vImage <= valueThresholdHigh);
 
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%5
    [hueCounts1, hueBinValues1] = imhist(hueMask); 
	maxHueBinValue1 = find(hueBinValues1 > 0, 1, 'last'); 
	maxCountHue1 = max(hueCounts1); 
   
	% Combine the masks to find where all 3 are "true."
	% Then we will have the mask of only the red parts of the image.
	coloredObjectsMask = uint8(hueMask & saturationMask & valueMask);


	% Tell user that we're going to filter out small objects.
	smallestAcceptableArea = 100; % Keep areas only if they're bigger than this.

	% Get rid of small objects.  Note: bwareaopen returns a logical.
	coloredObjectsMask = uint8(bwareaopen(coloredObjectsMask, smallestAcceptableArea));
	% Smooth the border using a morphological closing operation, imclose().
	structuringElement = strel('disk', 4);
	coloredObjectsMask = imclose(coloredObjectsMask, structuringElement);
	% Fill in any holes in the regions, since they are most likely red also.
	coloredObjectsMask = imfill(logical(coloredObjectsMask), 'holes');



	% You can only multiply integers if they are of the same type.
	% (coloredObjectsMask is a logical array.)
	% We need to convert the type of coloredObjectsMask to the same data type as hImage.
	coloredObjectsMask = cast(coloredObjectsMask, 'like', rgbImage); 

% 	coloredObjectsMask = cast(coloredObjectsMask, class(rgbImage));

	% Use the colored object mask to mask out the colored-only portions of the rgb image.
	maskedImageR = coloredObjectsMask .* rgbImage(:,:,1);
	maskedImageG = coloredObjectsMask .* rgbImage(:,:,2);
	maskedImageB = coloredObjectsMask .* rgbImage(:,:,3);

	maskedRGBImage = cat(3, maskedImageR, maskedImageG, maskedImageB);
return;


%----------------------------------------------------------------------------


%---------------------------------------------------------------------------------------------------------------------------------
% Ask user what color they want for the onions and peppers images and set up pre-defined threshold values.
function [hueThresholdLow, hueThresholdHigh, saturationThresholdLow, saturationThresholdHigh, valueThresholdLow, valueThresholdHigh] = SetThresholds()

% 	button = menu('What color do you want to find?', 'yellow', 'green', 'red', 'white');
	% Menu with purple commented out because it's all around and the regionfill just ends up selecting the whole image.
	%button = menu('What color do you want to find?', 'yellow', 'green', 'red', 'white', 'purple');
    load('check.mat', 'typefruit')
	if typefruit=="banna"
			% Yellow
			hueThresholdLow = 0.10;
			hueThresholdHigh = 0.14;
			saturationThresholdLow = 0.4;
			saturationThresholdHigh = 1;
			valueThresholdLow = 0.8;
			valueThresholdHigh = 1.0;
    else
			% Red.
			% IMPORTANT NOTE FOR RED.  Red spans hues both less than 0.1 and more than 0.8.
			% We're only getting one range here so we will miss some of the red pixels - those with hue less than around 0.1.
			% To properly get all reds, you'd have to get a hue mask that is the result of TWO threshold operations.
			hueThresholdLow = 0.80;
			hueThresholdHigh = 1;
			saturationThresholdLow = 0.58;
			saturationThresholdHigh = 1;
			valueThresholdLow = 0.55;
			valueThresholdHigh = 1.0;
	end

return; % From SetThresholds()

%---------------------------------------------------------------------------------------------------------------------------------

end
end
	