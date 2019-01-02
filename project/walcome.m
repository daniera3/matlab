function varargout = walcome(varargin)
% WALCOME MATLAB code for walcome.fig
%      WALCOME, by itself, creates a new WALCOME or raises the existing
%      singleton*.
%
%      H = WALCOME returns the handle to a new WALCOME or the handle to
%      the existing singleton*.
%
%      WALCOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WALCOME.M with the given input arguments.
%
%      WALCOME('Property','Value',...) creates a new WALCOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before walcome_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to walcome_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help walcome

% Last Modified by GUIDE v2.5 21-Nov-2017 00:29:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @walcome_OpeningFcn, ...
                   'gui_OutputFcn',  @walcome_OutputFcn, ...
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


% --- Executes just before walcome is made visible.
function walcome_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to walcome (see VARARGIN)

% Choose default command line output for walcome
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes walcome wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = walcome_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
pause(2);
pushbutton1_Callback(hObject, eventdata, handles);



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
main;