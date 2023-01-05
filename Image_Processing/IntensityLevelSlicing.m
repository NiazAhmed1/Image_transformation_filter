function varargout = IntensityLevelSlicing(varargin)
% INTENSITYLEVELSLICING MATLAB code for IntensityLevelSlicing.fig


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IntensityLevelSlicing_OpeningFcn, ...
                   'gui_OutputFcn',  @IntensityLevelSlicing_OutputFcn, ...
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





% --- Executes just before IntensityLevelSlicing is made visible.
function IntensityLevelSlicing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IntensityLevelSlicing (see VARARGIN)

% Choose default command line output for IntensityLevelSlicing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);






% --- Outputs from this function are returned to the command line.
function varargout = IntensityLevelSlicing_OutputFcn(hObject, eventdata, handles) 
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









% --- Executes on button press in Browse_Button.
function Browse_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




%set global Img 
global Img;

[Filename,Pathname]=uigetfile('*.*','File Selector');
name=strcat(Pathname,Filename);

%read Image
a = imread(name);

set(handles.edit1,'string',name);
axes(handles.axes1);

Img=imresize(a, [256,256])

imshow(Img), title("Original",'FontSize', 13,'color',[1 .69 0.06]);



% -------------------------------------------------------------------------






% --- Executes on button press in Back_Button.
function Back_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Back_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


OperationScreen
delete(IntensityLevelSlicing)



% -------------------------------------------------------------------------



% --- Executes on button press in Close_Button.
function Close_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Close_Button (see GCBO)
% eventdata  azreserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

delete(IntensityLevelSlicing)

% -------------------------------------------------------------------------





% --- Executes on button press in Apply_Button.
function Apply_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Apply_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





%Img -> image that we browse
global Img;

%Convert Image Into Gray Scale
g=im2gray(Img);


%retrieve number of rows and columns
[M,N]=size(g);


%Take value of Upper threshold and lower Threshold from user
v1=str2double(get(handles.L_Value,'String'));
v2=str2double(get(handles.U_Value,'String'));


%Approach 1
%Set value of all pixels within range of interest to white and all other to
%black


a=g;
for i=1:M
    for j=1:N
        if g(i,j)>=v1 && g(i,j)<=v2
            a(i,j)=255;
        else
            a(i,j)=0; 
        end
    end
end


%Approach 2
%Set value of all pixels within range of interest to white and all other
%remain unchange

b=g;
for i=1:M
    for j=1:N
        if g(i,j)>=v1 && g(i,j)<=v2
            b(i,j)=255;
        else
            b(i,j)=g(i,j);
        end
    end
end



%show gray scale image on axes 2
axes(handles.axes2);

%show Image
imshow(g);
title("Gray Scale Image",'FontSize', 11, 'color',[1 .69 0.06])


%show image on axes 3
axes(handles.axes3);
%show Imageof Appraoch 1
imshow(a);
title("Approach 1",'FontSize', 11, 'color',[1 .69 0.06])




%show image on axes 4
axes(handles.axes4);
%show Image of Approach
imshow(b);
title("Approach 2",'FontSize', 11, 'color',[1 .69 0.06])


% -----------------------------------------------------------------------------




function U_Value_Callback(hObject, eventdata, handles)
% hObject    handle to U_Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of U_Value as text
%        str2double(get(hObject,'String')) returns contents of U_Value as a double






% --- Executes during object creation, after setting all properties.
function U_Value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to U_Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end







function L_Value_Callback(hObject, eventdata, handles)
% hObject    handle to L_Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L_Value as text
%        str2double(get(hObject,'String')) returns contents of L_Value as a double






% --- Executes during object creation, after setting all properties.
function L_Value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


