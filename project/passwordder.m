function varargout = passwordder(varargin)
% PASSWORDDER MATLAB code for passwordder.fig
%      PASSWORDDER, by itself, creates a new PASSWORDDER or raises the existing
%      singleton*.
%
%      H = PASSWORDDER returns the handle to a new PASSWORDDER or the handle to
%      the existing singleton*.
%
%      PASSWORDDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PASSWORDDER.M with the given input arguments.
%
%      PASSWORDDER('Property','Value',...) creates a new PASSWORDDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before passwordder_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to passwordder_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help passwordder

% Last Modified by GUIDE v2.5 24-Dec-2017 12:14:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @passwordder_OpeningFcn, ...
                   'gui_OutputFcn',  @passwordder_OutputFcn, ...
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


% --- Executes just before passwordder is made visible.
function passwordder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to passwordder (see VARARGIN)

% Choose default command line output for passwordder
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes passwordder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = passwordder_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
load('derpass.mat','derInput1');
val = get(handles.edit1,'String');
if string(val)==string("free")
    clc;
    testcase1=Test1;
    result1=run(testcase1)
    xlswrite('unit_test', table2cell(table(result1)));
end
if string(val)==string(derInput1)
    clear val;
    close passwordder;
    derector;
else
    message = sprintf('סיסמה שגויה');
    questdlg(message, 'pass', 'OK', 'OK');
    set(handles.edit1,'String','');
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 close passwordder;
