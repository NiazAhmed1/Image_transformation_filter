function varargout = pwer_Law_Transformation(varargin)
% PWER_LAW_TRANSFORMATION MATLAB code for pwer_Law_Transformation.fig


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pwer_Law_Transformation_OpeningFcn, ...
                   'gui_OutputFcn',  @pwer_Law_Transformation_OutputFcn, ...
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






% --- Executes just before pwer_Law_Transformation is made visible.
function pwer_Law_Transformation_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pwer_Law_Transformation (see VARARGIN)



% Choose default command line output for pwer_Law_Transformation
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pwer_Law_Transformation wait for user response (see UIRESUME)
% uiwait(handles.figure1);







% --- Outputs from this function are returned to the command line.
function varargout = pwer_Law_Transformation_OutputFcn(hObject, eventdata, handles) 

% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% ----------------------------------------------------------------------------------------








% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)

% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%set global Img 
global Img;

[Filename,Pathname]=uigetfile('*.*','File Selector');
File=strcat(Pathname,Filename);

%read Image
a = imread(File);

set(handles.edit1,'string',File);
axes(handles.axes1);


Img=imresize(a, [256,256])

imshow(Img), title("Original",'FontSize', 13,'color',[1 .69 0.06]);


% --------------------------------------------------------------------------------------





function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double




% ---------------------------------------------------------------------------------------





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





% ------------------------------------------------------------------------------------------






% --- Executes on button press in Power_T_button.
function Power_T_button_Callback(hObject, eventdata, handles)

% hObject    handle to Power_T_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%Img -> image that we browse 
global Img;


%value of constant
c=1;


%Take value of gamma from user
gamma=str2double(get(handles.edit3,'String'));


%Convert image into double
i=im2double(Img)


%Formula of power Law Transformation
s=c*(i.^gamma)


%Display image on axes2
axes(handles.axes2)


%show Image
imshow(s);
title("Power Transformation",'FontSize', 11, 'color',[1 .69 0.06])


% -------------------------------------------------------------------------------------------------


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double





% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --- Executes on button press in back_Button.
function back_Button_Callback(hObject, eventdata, handles)
% hObject    handle to back_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OperationScreen;
delete(pwer_Law_Transformation);





% --- Executes on button press in close_button.
function close_button_Callback(hObject, eventdata, handles)
% hObject    handle to close_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(pwer_Law_Transformation)
