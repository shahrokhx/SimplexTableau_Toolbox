function varargout = SimplexTool(varargin)
% SIMPLEXTOOL MATLAB code for SimplexTool.fig
%      SIMPLEXTOOL, by itself, creates a new SIMPLEXTOOL or raises the existing
%      singleton*.
%
%      H = SIMPLEXTOOL returns the handle to a new SIMPLEXTOOL or the handle to
%      the existing singleton*.
%
%      SIMPLEXTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMPLEXTOOL.M with the given input arguments.
%
%      SIMPLEXTOOL('Property','Value',...) creates a new SIMPLEXTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SimplexTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SimplexTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SimplexTool

% Last Modified by GUIDE v2.5 19-Sep-2021 06:12:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SimplexTool_OpeningFcn, ...
                   'gui_OutputFcn',  @SimplexTool_OutputFcn, ...
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


% --- Executes just before SimplexTool is made visible.
function SimplexTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SimplexTool (see VARARGIN)

% Choose default command line output for SimplexTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SimplexTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%%  My Initialization:

% showVal = get (handles.checkbox1,'Value')
set (handles.checkbox1,'Value',1)


% Example
initial_tableau =[ ...
       2   1   1   1  1  0  0  0   0  16
       1   1   2  -1  0  1  0  0   0  8
       0   1   0  -1  0  0  1  0   0  6
       2  -1   0   0  0  0  0  1   0  7
      -4  -5  -4  -2  0  0  0  0  -1  0];
set(handles.uitable1,'data',initial_tableau)

numDV = str2num(get(handles.edit1,'String'));
numConstr = str2num(get(handles.edit2,'String'));
set(handles.uitable1, 'ColumnWidth',num2cell(26*ones(1,2*numDV+2)));

set(handles.text13,'String',['Optimum Value = ','?'])
set(handles.uitable2,'data',zeros(1,numDV))
set(handles.uitable2, 'ColumnWidth',num2cell(40*ones(1,numDV)));

% --- Outputs from this function are returned to the command line.
function varargout = SimplexTool_OutputFcn(hObject, eventdata, handles) 
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
numDV = str2num(get(handles.edit1,'String'));
numConstr = str2num(get(handles.edit2,'String'));
% m = get(handles.uitable1, 'Data');
set(handles.uitable1, 'Data', zeros(numConstr+1,2*numDV+2));
set(handles.uitable1, 'ColumnWidth',num2cell(26*ones(1,2*numDV+2)));
set(handles.text13,'String',['Optimum Value = ','?'])
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

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
numDV = str2num(get(handles.edit1,'String'));
numConstr = str2num(get(handles.edit2,'String'));
set(handles.uitable1, 'Data', zeros(numConstr+1,2*numDV+2));
set(handles.uitable1, 'ColumnWidth',num2cell(26*ones(1,2*numDV+2)));
set(handles.text13,'String',['Optimum Value = ','?'])
% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
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
showVal = get (handles.checkbox1,'Value');
if showVal
    if get (handles.radiobutton8,'Value'); format_mode = 2; end
    if get (handles.radiobutton9,'Value'); format_mode = 1; end
else
    format_mode = 0;
end

numDV = str2num(get(handles.edit1,'String'));
init_mat = get(handles.uitable1, 'Data');

wait = str2num(get(handles.edit7,'String'));

[x,fval]  = simplex (init_mat , numDV, format_mode, wait);
set(handles.uitable2,'data',x);
set(handles.uitable2, 'ColumnWidth',num2cell(40*ones(1,numDV)));
set(handles.text13,'String',['Optimum Value =   ',num2str(fval)])

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

showVal = get (handles.checkbox1,'Value');

if showVal 
    set(handles.uibuttongroup3, 'Visible', 'on');
else
    set(handles.uibuttongroup3, 'Visible', 'off');
end
% Hint: get(hObject,'Value') returns toggle state of checkbox1



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web("https://www.sshahi.com/")