function varargout = banna(varargin)
% BANNA MATLAB code for banna.fig
%      BANNA, by itself, creates a new BANNA or raises the existing
%      singleton*.
%
%      H = BANNA returns the handle to a new BANNA or the handle to
%      the existing singleton*.
%
%      BANNA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BANNA.M with the given input arguments.
%
%      BANNA('Property','Value',...) creates a new BANNA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before banna_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to banna_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help banna

% Last Modified by GUIDE v2.5 10-Dec-2017 19:33:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @banna_OpeningFcn, ...
                   'gui_OutputFcn',  @banna_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...p
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before banna is made visible.
function banna_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to banna (see VARARGIN)

% Choose default command line output for banna
handles.output = hObject;
set(handles.pushbutton4,'enable','off')

% Update handles structure
guidata(hObject, handles);
set(handles.pushbutton4, 'visible','off');
 % load the data from the mat file
  load('myOptionsB.mat','a');
 % update the popup menu
 set(handles.popupmenu1,'String',a);
% UIWAIT makes banna wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = banna_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close banna;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
webcam_gettingstarted;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [baseFileName, folder] = uigetfile({'*.jpg;*.tif;*.png;*.gif'}, 'Specify an image file'); 
 fullImageFileName = fullfile(folder, baseFileName);
 if (fullImageFileName ~=0)
 img=imread(fullImageFileName);
 axes(handles.axes1);
 imshow(img)
 save('img.mat','fullImageFileName','-append');
 set(handles.pushbutton4, 'visible','on')

 end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  
  load('img.mat', 'fullImageFileName');
  typefruit="banna";
  ImageNum=2;
  save("check.mat",'typefruit','ImageNum','-append')
  [ImToDisp,ImToDisp2, MaskPixel] = Fruit(fullImageFileName,ImageNum);
  ImagePixel = SizeInPixels(fullImageFileName);
  [flag,percent] = CalcFruit(ImagePixel, MaskPixel, ImageNum);
  CheckDiam = Diameter(fullImageFileName);
  nowsize = mysize(fullImageFileName) ;
        if (CheckDiam >= 0.5|| nowsize>=120)
            DiamFlag = true;
        else 
            DiamFlag = false;
        end
        if (flag == true && DiamFlag == true)
            a="good diametar and colore";
            b="this fruit calss:A";
        class="A";
        elseif (flag == true && DiamFlag == false)
            a="good colore but bad diametar";
            b="this fruit calss:B";
        class="B";
        elseif (flag == false && DiamFlag == true)
            a="good diametar but bad colore";
            b="this fruit calss:C";
        class="C";  
        else
            a="bad diametar and colore";
            b="this fruit calss:C";
        class="C";  
        end
        set(handles.text1,'string',a);
        set(handles.text2,'string',b);
        save('check.mat','typefruit','ImageNum','CheckDiam','percent','class','-append')
        load('check.mat', 'dat_init')
        load('check.mat', 'Provider')
        [~,s]=size(dat_init);
        if (s~=1)
        dat_init(s+1)=typefruit;
        dat_init(s+2)=Provider;
        dat_init(s+3)=class;
        else
        dat_init(s)=typefruit;
        dat_init(s+1)=Provider;
        dat_init(s+2)=class; 
        end
        save('check.mat','dat_init','-append')
        


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(hObject,'value');
str=get(hObject,'string');
if val~=1
    set(handles.pushbutton4,'enable','on')
end
Provider=str(val);
Provider=string(Provider{1});
save("check.mat",'Provider','-append')
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
