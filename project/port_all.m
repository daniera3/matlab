function varargout = port_all(varargin)
% PORT_ALL MATLAB code for port_all.fig
%      PORT_ALL, by itself, creates a new PORT_ALL or raises the existing
%      singleton*.
%
%      H = PORT_ALL returns the handle to a new PORT_ALL or the handle to
%      the existing singleton*.
%
%      PORT_ALL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PORT_ALL.M with the given input arguments.
%
%      PORT_ALL('Property','Value',...) creates a new PORT_ALL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before port_all_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to port_all_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help port_all

% Last Modified by GUIDE v2.5 10-Dec-2017 22:56:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @port_all_OpeningFcn, ...
                   'gui_OutputFcn',  @port_all_OutputFcn, ...
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


% --- Executes just before port_all is made visible.
function port_all_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to port_all (see VARARGIN)

% Choose default command line output for port_all
handles.output = hObject;

% Update handles structure
 
load('check.mat', 'dat_init')
s=numel(dat_init);
 dath="";
if(s~=1)
    t=1;
    p=s/3+1;
    c=(s/3)*2+1;
for i=1:s
    if(mod(i,3)==1)
    str=dat_init(1,i);
    dath(1,t)=str;
    t=1+t;
    elseif(mod(i,3)==2)
    dath(1,p)=dat_init(1,i);
    p=1+p;   
    else
    dath(1,c)=dat_init(1,i);
    c=1+c;   
    end
end

dat_init=cellstr(dath);   
dat=reshape(dat_init,[],3);
save('check.mat','dat','-append')
%% insert data into dataset
t=uitable('Data', dat, 'ColumnName',...
        {'fruit type', 'provider', 'class'},...
        'Position', [1 5 260.0 250.077]);
xlswrite('path_dataname',dat);
end
guidata(hObject, handles);
% UIWAIT makes port_all wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = port_all_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close port_all;
