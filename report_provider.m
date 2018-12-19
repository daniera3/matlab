function varargout = report_provider(varargin)
% REPORT_PROVIDER MATLAB code for report_provider.fig
%      REPORT_PROVIDER, by itself, creates a new REPORT_PROVIDER or raises the existing
%      singleton*.
%
%      H = REPORT_PROVIDER returns the handle to a new REPORT_PROVIDER or the handle to
%      the existing singleton*.
%
%      REPORT_PROVIDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REPORT_PROVIDER.M with the given input arguments.
%
%      REPORT_PROVIDER('Property','Value',...) creates a new REPORT_PROVIDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before report_provider_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to report_provider_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help report_provider

% Last Modified by GUIDE v2.5 24-Dec-2017 12:50:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @report_provider_OpeningFcn, ...
                   'gui_OutputFcn',  @report_provider_OutputFcn, ...
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


% --- Executes just before report_provider is made visible.
function report_provider_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to report_provider (see VARARGIN)

% Choose default command line output for report_provider
handles.output = hObject;
set(handles.popupmenu1,'String',{'apple', 'banna', 'peach'});
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes report_provider wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = report_provider_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
val = get(hObject,'Value');
str = get(hObject,'string');
% Set current data to the selected data set.
if(val==1)
    filename='myOptionsA.mat';
elseif(val==2)
    filename='myOptionsB.mat';
else 
    filename='myOptionsP.mat';
end
load(filename,'a');
set(handles.popupmenu2,'String',a);
set(handles.popupmenu2, 'visible','on')


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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
val = get(hObject,'Value');
if(val~=1)
str = get(hObject,'string');
load('check.mat', 'dat_init')
strnow="";
t=1;
now=count(dat_init,str(val));
[~,i]=size(now);
for c=1:i
   if(now(c)==1)
     strnow(t)=dat_init(c+1);
     t=t+1;
   end
end
countA=0;
countB=0;
countC=0;
A=count(strnow,"A");
[~,i]=size(A);
for c=1:i
   countA=countA+A(c);
end
B=count(strnow,"B");
[~,i]=size(B);
for c=1:i
   countB=countB+B(c);
end
C=count(strnow,"C");
[~,i]=size(C);
for c=1:i
   countC=countC+C(c);
end
if(countA==0&&countB==0&&countC==0)
    str="he no sell fruit";
elseif (countA>countB && countA>countC)
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
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close report_provider;
