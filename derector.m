function varargout = derector(varargin)
% DERECTOR MATLAB code for derector.fig
%      DERECTOR, by itself, creates a new DERECTOR or raises the existing
%      singleton*.
%
%      H = DERECTOR returns the handle to a new DERECTOR or the handle to
%      the existing singleton*.
%
%      DERECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DERECTOR.M with the given input arguments.
%
%      DERECTOR('Property','Value',...) creates a new DERECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before derector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to derector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help derector

% Last Modified by GUIDE v2.5 03-Dec-2017 20:40:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @derector_OpeningFcn, ...
                   'gui_OutputFcn',  @derector_OutputFcn, ...
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


% --- Executes just before derector is made visible.
function derector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to derector (see VARARGIN)

% Choose default command line output for derector
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes derector wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = derector_OutputFcn(hObject, eventdata, handles) 
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
close derector;

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
changede;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
report_provider;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addsupply;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete_Provider;
