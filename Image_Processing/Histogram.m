function varargout = Histogram(varargin)


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Histogram_OpeningFcn, ...
                   'gui_OutputFcn',  @Histogram_OutputFcn, ...
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



% --- Executes just before Histogram is made visible.
function Histogram_OpeningFcn(hObject, eventdata, handles, varargin)



% Choose default command line output for Histogram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Histogram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Histogram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Back_Button.
function Back_Button_Callback(hObject, eventdata, handles)

OperationScreen;
delete(Histogram);


% -----------------------------------------------------------------------------------------------

% --- Executes on button press in Browse_Button.
function Browse_Button_Callback(hObject, eventdata, handles)


global Img;

%Browse path of image
[Filename,Pathname]=uigetfile('*.*','File Selector');
name=strcat(Pathname,Filename);

%Read Image
a = imread(name);


set(handles.edit1,'string',name);
axes(handles.axes1);

%reisze the Image by 256 X 256 
Img=imresize(a, [256,256]);

%show Image
imshow(Img);
title("Original",'FontSize', 15,'color',[1 .69 0.06]);


%--------------------------------------------------------------------------------------------------




% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)

%set Variable 
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



% -----------------------------------------------------------------------------------------------


% --- Executes on button press in Normalized_Button.
function Normalized_Button_Callback(hObject, eventdata, handles)

%set Variable 
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
counts=counts/(rows*columns);
axes(handles.axes3);
bar(grayLevels, counts, 'BarWidth', 1, 'FaceColor', 'b');
xlabel('Gray Level', 'FontSize', 11);
ylabel('Pixel Count', 'FontSize', 11);


grid on;

%change The color of gridLine
ch = gca % Get handle to current axes.

ch.XColor = 'r'; % Red
ch.YColor = 'r'; % Red









% --------------------------------------------------------------------------------------------



% --- Executes on button press in HistEq_Button.
function HistEq_Button_Callback(hObject, eventdata, handles)

%set global Variabl
global Img;
global HE;
O_img = Img;


% Count the totoal number of Pixel present in image
numofpixels=size(O_img,1)*size(O_img,2);


%type casting
HE=uint8(zeros(size(O_img,1),size(O_img,2)));

%for frequency calculation
freq=zeros(256,1);


%The probability of each occurrence is calculated by probf.
probf=zeros(256,1);


probc=zeros(256,1);

cum=zeros(256,1);
output=zeros(256,1);


%freq counts the occurrence of each pixel value.

for i=1:size(O_img,1)

    for j=1:size(O_img,2) 
        
        value=O_img(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/numofpixels;

    end

end

sum=0;
no_bins=255;

%The cumulative distribution probability is calculated. 
for i=1:size(probf)

   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/numofpixels;
   output(i)=round(probc(i)*no_bins);

end

for i=1:size(O_img,1)

    for j=1:size(O_img,2)
            HE(i,j)=output(O_img(i,j)+1);
    end
end


%Determine histogram of Image after Histogram Equalization

[r, c] = size(HE);
count = zeros(1, 256);

for j = 1 : c
	for i = 1 : r
        
        
		% Get the gray level.
		grayL = HE(i, j);
		% Add 1 because graylevel zero goes into index 1 and so on.
		count(grayL+ 1) = count(grayL+1) + 1;
	
    end
end

% Plot the histogram.
grayL = 0 : 255;

axes(handles.axes5);
bar(grayL, count, 'BarWidth', 1, 'FaceColor', 'b');
xlabel('Gray Level', 'FontSize', 8);
ylabel('Pixel Count', 'FontSize', 8);

grid on;

%chnage the color of grid lines

ch = gca;   % Get handle to current axes.
ch.XColor = 'r'; % Red
ch.YColor = 'r'; % Red


%------------------------------------------------------------------------------------------

% --- Executes on button press in HistEquImg.
function HistEquImg_Callback(hObject, eventdata, handles)

%set global Variabl

global Img;
O_img = Img


% Count the totoal number of Pixel present in image
numofpixels=size(O_img,1)*size(O_img,2);


%type casting
HE=uint8(zeros(size(O_img,1),size(O_img,2)));

%for frequency calculation
freq=zeros(256,1);


%The probability of each occurrence is calculated by probf.
probf=zeros(256,1);


probc=zeros(256,1);

cum=zeros(256,1);
output=zeros(256,1);


%freq counts the occurrence of each pixel value.

for i=1:size(O_img,1)

    for j=1:size(O_img,2) 
        
        value=O_img(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/numofpixels;

    end

end

sum=0;
no_bins=255;

%The cumulative distribution probability is calculated. 
for i=1:size(probf)

   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/numofpixels;
   output(i)=round(probc(i)*no_bins);

end

for i=1:size(O_img,1)

    for j=1:size(O_img,2)
            HE(i,j)=output(O_img(i,j)+1);
    end
end

axes(handles.axes4);
% plot Image After Histogram Equalization
imshow(HE);




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




% --- Executes on button press in close_button.
function close_button_Callback(hObject, eventdata, handles)
% hObject    handle to close_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(Histogram)
