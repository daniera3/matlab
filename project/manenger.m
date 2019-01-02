function varargout = manenger(varargin)
% MANENGER MATLAB code for manenger.fig
%      MANENGER, by itself, creates a new MANENGER or raises the existing
%      singleton*.
%
%      H = MANENGER returns the handle to a new MANENGER or the handle to
%      the existing singleton*.
%
%      MANENGER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANENGER.M with the given input arguments.
%
%      MANENGER('Property','Value',...) creates a new MANENGER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before manenger_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to manenger_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help manenger

% Last Modified by GUIDE v2.5 21-Nov-2017 00:41:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @manenger_OpeningFcn, ...
                   'gui_OutputFcn',  @manenger_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before manenger is made visible.
function manenger_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to manenger (see VARARGIN)

% Choose default command line output for manenger
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes manenger wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = manenger_OutputFcn(hObject, eventdata, handles) 
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
close manenger;

% --- Executes on button press in pushbutton2.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('check.mat', 'dat_init')
countA=0;
countB=0;
countC=0;
A=count(dat_init,"A");
[~,i]=size(A);
for c=1:i
   countA=countA+A(c);
end
B=count(dat_init,"B");
[~,i]=size(B);
for c=1:i
   countB=countB+B(c);
end
C=count(dat_init,"C");
[~,i]=size(C);
for c=1:i
   countC=countC+C(c);
end
if (countA>countB && countA>countC)
    str="A";
elseif(countB>countA && countB>countC)
   str="B";
elseif(countC>countA && countC>countB)
     str="C";
elseif(countB>countA && countB==countC)
     str="C+";
elseif(countB==countA && countB>countC)
    str="B+";
else
    str="B-";
end
message = sprintf('%s',str);
    questdlg(message, 'איכות', 'OK', 'OK');

% --- Executes on button press in pushbutton3.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
port_all;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
change;
