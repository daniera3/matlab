function varargout = delete_Provider(varargin)
% DELETE_PROVIDER MATLAB code for delete_Provider.fig
%      DELETE_PROVIDER, by itself, creates a new DELETE_PROVIDER or raises the existing
%      singleton*.
%
%      H = DELETE_PROVIDER returns the handle to a new DELETE_PROVIDER or the handle to
%      the existing singleton*.
%
%      DELETE_PROVIDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DELETE_PROVIDER.M with the given input arguments.
%
%      DELETE_PROVIDER('Property','Value',...) creates a new DELETE_PROVIDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before delete_Provider_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to delete_Provider_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help delete_Provider

% Last Modified by GUIDE v2.5 03-Dec-2017 21:26:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @delete_Provider_OpeningFcn, ...
                   'gui_OutputFcn',  @delete_Provider_OutputFcn, ...
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


% --- Executes just before delete_Provider is made visible.
function delete_Provider_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to delete_Provider (see VARARGIN)

% Choose default command line output for delete_Provider
handles.output = hObject;
 set(handles.pushbutton1,'visible','off')
 set(handles.popupmenu2,'visible','off')
% Update handles structure
guidata(hObject, handles);
clear all;
% UIWAIT makes delete_Provider wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = delete_Provider_OutputFcn(hObject, eventdata, handles) 
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
global val,global filename;
load(filename,'a');
assignin('base','val',val);
if(val~=1)
max =size('a');
assignin('base','max',max);
a(val) = [];
  for i=val:(max-1)
    a(i,1)=string(a(1+1,1));
    if(i==max)
    a(i,1)=[];  
    end
  end
  message = sprintf('he delete');
  questdlg(message, 'pass', 'OK', 'OK');
else
    message = sprintf('you need chose');
    questdlg(message, 'pass', 'OK', 'OK');
end
save(filename,'a','-append');
guidata(hObject, handles);
set(handles.popupmenu2,'String',a);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
button = menu('אזה ספק למחוק לפי סוג הפרי שמספק?', 'תפוח', 'בננה', 'אפרסק');
    switch button
		case 1
             filename='myOptionsA.mat';
           
        case 2
             filename='myOptionsA.mat';
         
        case 3
             filename='myOptionsP.mat';
    end
     load(filename);
     set(handles.popupmenu2,'String',a);
     set(handles.pushbutton1,'visible','on')
     set(handles.popupmenu2,'visible','on')


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val;
val = get(hObject,'Value');
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close delete_Provider;
clear all;
