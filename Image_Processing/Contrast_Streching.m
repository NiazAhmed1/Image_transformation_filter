function varargout = Contrast_Streching(varargin)



% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Contrast_Streching_OpeningFcn, ...
                   'gui_OutputFcn',  @Contrast_Streching_OutputFcn, ...
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







% --- Executes just before Contrast_Streching is made visible.
function Contrast_Streching_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Contrast_Streching (see VARARGIN)



% Choose default command line output for Contrast_Streching
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% ---------------------------------------------------------------------------------------





% --- Outputs from this function are returned to the command line.
function varargout = Contrast_Streching_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;





% --- Executes on button press in back_button.
function back_button_Callback(hObject, eventdata, handles)


% hObject    handle to back_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


OperationScreen;
delete(Contrast_Streching);



% --------------------------------------------------------------------------------------------





function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double



% --------------------------------------------------------------------------------------




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

% ----------------------------------------------------------------------------------------------



% --- Executes on button press in Browse_Button.
function Browse_Button_Callback(hObject, eventdata, handles)


% hObject    handle to Browse_Button (see GCBO)
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

imshow(Img);
title("Original",'FontSize', 15,'color',[1 .69 0.06]);



% -------------------------------------------------------------------------------





% --- Executes on button press in hist.
function hist_Callback(hObject, eventdata, handles)
% hObject    handle to hist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global Img


O_img = Img

%code to determine the histogram of Image
[rows, columns] = size(O_img);
counts = zeros(1, 256);

for col = 1 : columns
	for row = 1 : rows
        
		% Get the gray level.
		grayLevel = O_img(row, col);
		% Add 1 because graylevel zero goes into index 1 and so on.
		
        counts(grayLevel+ 1) = counts(grayLevel+1) + 1;
	end
end


% Plot the histogram.
grayLevels = 0 : 255;
axes(handles.axes2);

bar(grayLevels, counts, 'BarWidth', 1, 'FaceColor', 'b');
xlabel('Gray Level', 'FontSize', 11);
ylabel('Pixel Count', 'FontSize', 11);

grid on;

%change The color of gridLine
ch = gca % Get handle to current axes.

ch.XColor = 'r'; % Red
ch.YColor = 'r'; % Red




% ----------------------------------------------------------------------------------------







% --- Executes on button press in Contrast_Img.
function Contrast_Img_Callback(hObject, eventdata, handles)

% hObject    handle to Contrast_Img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Img -> image that we browse
global Img
global g


% find the mean of image.
m=mean(Img(:));

% Take value of E from User
E=str2double(get(handles.e,'String'))

%formula to calculate contrast streching
g=1./(1 + (m./(double(Img) + eps)).^E) 

%Display Image of Contrast Streching
axes(handles.axes3);
imshow(g);
title("Contrast Image",'FontSize', 12,'color',[1 .69 0.06])


% ---------------------------------------------------------------------------------------





% --- Executes on button press in ContrastHist.
function ContrastHist_Callback(hObject, eventdata, handles)

% hObject    handle to ContrastHist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global g


axes(handles.axes4);
imhist(g);



% -----------------------------------------------------------------------------------


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(Contrast_Streching)





function e_Callback(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e as text
%        str2double(get(hObject,'String')) returns contents of e as a double





% --- Executes during object creation, after setting all properties.
function e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


