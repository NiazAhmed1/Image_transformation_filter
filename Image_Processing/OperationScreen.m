function varargout = OperationScreen(varargin)



% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OperationScreen_OpeningFcn, ...
                   'gui_OutputFcn',  @OperationScreen_OutputFcn, ...
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


%------------------------------------------------------------------------------------------------




% --- Executes just before OperationScreen is made visible.
function OperationScreen_OpeningFcn(hObject, eventdata, handles, varargin)


% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OperationScreen (see VARARGIN)



% Choose default command line output for OperationScreen
handles.output = hObject;


% Logo Image
logo=imread('logo.jpg')
axes(handles.axes1)
imshow(logo)



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OperationScreen wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% -------------------------------------------------------------------------



% --- Outputs from this function are returned to the command line.

function varargout = OperationScreen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% -----------------------------------------------------------------------------------





% --- Executes on button press in Back_Button.
function Back_Button_Callback(hObject, eventdata, handles)

% hObject    handle to Back_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

OpenScreen               % when press on button then go to OpenScreen
delete(OperationScreen)  % and remove OperationScreen


% -------------------------------------------------------------------------------


% --- Executes on button press in Histograms.
function Histograms_Callback(hObject, eventdata, handles)

% hObject    handle to Histograms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Histogram
delete(OperationScreen)


% ----------------------------------------------------------------------------------



% --- Executes on button press in BitPlanSlicing.
function BitPlanSlicing_Callback(hObject, eventdata, handles)

% hObject    handle to BitPlanSlicing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Bit_Plan_Slicing
delete(OperationScreen)


% ---------------------------------------------------------------------------------------

% --- Executes on button press in PowerTransformation.
function PowerTransformation_Callback(hObject, eventdata, handles)
% hObject    handle to PowerTransformation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

pwer_Law_Transformation
delete(OperationScreen)

% --------------------------------------------------------------------------------------



% --- Executes on button press in IntensityLevelSlicing.
function IntensityLevelSlicing_Callback(hObject, eventdata, handles)
% hObject    handle to IntensityLevelSlicing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

IntensityLevelSlicing
delete(OperationScreen)


% ---------------------------------------------------------------------------------------------


% --- Executes on button press in ContrastStreching.
function ContrastStreching_Callback(hObject, eventdata, handles)
% hObject    handle to ContrastStreching (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Contrast_Streching
delete(OperationScreen)





% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






% --- Executes on button press in close_button.
function close_button_Callback(hObject, eventdata, handles)
% hObject    handle to close_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

delete(OperationScreen)


