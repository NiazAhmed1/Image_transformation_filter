function varargout = Bit_Plan_Slicing(varargin)
% BIT_PLAN_SLICING MATLAB code for Bit_Plan_Slicing.fig




% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Bit_Plan_Slicing_OpeningFcn, ...
                   'gui_OutputFcn',  @Bit_Plan_Slicing_OutputFcn, ...
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








% --- Executes just before Bit_Plan_Slicing is made visible.
function Bit_Plan_Slicing_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Bit_Plan_Slicing (see VARARGIN)






% Choose default command line output for Bit_Plan_Slicing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Bit_Plan_Slicing wait for user response (see UIRESUME)
% uiwait(handles.figure1);






% --- Outputs from this function are returned to the command line.
function varargout = Bit_Plan_Slicing_OutputFcn(hObject, eventdata, handles) 


% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

varargout{1} = handles.output;






% --- Executes on button press in Back_Button.
function Back_Button_Callback(hObject, eventdata, handles)


% hObject    handle to Back_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


OperationScreen
delete(Bit_Plan_Slicing)




% --- Executes on button press in Close_Button.
function Close_Button_Callback(hObject, eventdata, handles)

% hObject    handle to Close_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(Bit_Plan_Slicing)




% --- Executes on button press in BrowseButton.
function BrowseButton_Callback(hObject, eventdata, handles)

% hObject    handle to BrowseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global Img;

%Browse path of image
[Filename,Pathname]=uigetfile('*.*','File Selector');
File=strcat(Pathname,Filename);

%Read Image
a = imread(File);

set(handles.edit1,'string',File);
axes(handles.axes1);

%reisze the Image by 256 X 256 
Img=imresize(a, [256,256]);

%show Image
imshow(Img);
title("Original",'FontSize', 15,'color',[1 .69 0.06]);






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





% --- Executes on button press in Apply_button.
function Apply_button_Callback(hObject, eventdata, handles)
% hObject    handle to Apply_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%Image that we browse
global Img


%convert Image into gray Scale
grayScale=im2gray(Img);

dImg = double(grayScale);
  


%get bits of image

b1 = mod(dImg, 2);
b2 = mod(floor(dImg/2), 2);
b3 = mod(floor(dImg/4), 2);
b4 = mod(floor(dImg/8), 2);
b5 = mod(floor(dImg/16), 2);
b6 = mod(floor(dImg/32), 2);
b7 = mod(floor(dImg/64), 2);
b8 = mod(floor(dImg/128), 2);
 

%Combine all bits
cb = (2 * (2 * (2 * (2 * (2 * (2 * (2 * b8 + b7) + b6) + b5) + b4) + b3) + b2) + b1);
  

%plot original image
subplot(3, 5, 1);
imshow(Img);
title('Original Image','color',[1 .69 0.06]);
  


%plot gray scale image
subplot(3, 5, 2);
imshow(grayScale);
title('GrayScale Image','color',[1 .69 0.06])



%plot bitwise Image

subplot(3, 5, 3);
imshow(b1);
title('Bit Plane 1','color',[1 .69 0.06]);

subplot(3, 5, 4);
imshow(b2);
title('Bit Plane 2','color',[1 .69 0.06]);

subplot(3, 5, 5);
imshow(b3);
title('Bit Plane 3','color',[1 .69 0.06]);

subplot(3, 5, 6);
imshow(b4);
title('Bit Plane 4','color',[1 .69 0.06]);

subplot(3, 5, 7);
imshow(b5);
title('Bit Plane 5','color',[1 .69 0.06]);

subplot(3, 5, 8);
imshow(b6);
title('Bit Plane 6','color',[1 .69 0.06]);

subplot(3, 5, 9);
imshow(b7);
title('Bit Plane 7','color',[1 .69 0.06]);

subplot(3, 5, 10);
imshow(b8);
title('Bit Plane 8','color',[1 .69 0.06]);
  

% plotting recombined image Plan
subplot(3, 5, 11);
imshow(uint8(cb));
title('Recombined Image','color',[1 .69 0.06]);


% ------------------------------------------------------------------------------------------------------
