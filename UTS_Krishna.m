function varargout = UTS_Fahmi(varargin)
% UTS_FAHMI MATLAB code for UTS_Fahmi.fig
%      UTS_FAHMI, by itself, creates a new UTS_FAHMI or raises the existing
%      singleton*.
%
%      H = UTS_FAHMI returns the handle to a new UTS_FAHMI or the handle to
%      the existing singleton*.
%
%      UTS_FAHMI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UTS_FAHMI.M with the given input arguments.
%
%      UTS_FAHMI('Property','Value',...) creates a new UTS_FAHMI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UTS_Fahmi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UTS_Fahmi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UTS_Fahmi

% Last Modified by GUIDE v2.5 28-Apr-2021 11:19:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UTS_Fahmi_OpeningFcn, ...
                   'gui_OutputFcn',  @UTS_Fahmi_OutputFcn, ...
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


% --- Executes just before UTS_Fahmi is made visible.
function UTS_Fahmi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UTS_Fahmi (see VARARGIN)

% Choose default command line output for UTS_Fahmi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UTS_Fahmi wait for user response (see UIRESUME)
% uiwait(handles.figure1);
mi_axes = axes('unit', 'normalized', 'position', [0 0  1 1]); 
bgnya = imread('bg.jpg');                       % memanggil gambar
imagesc(bgnya);
set(mi_axes, 'handlevisibility', 'off', 'visible', 'off')


% --- Outputs from this function are returned to the command line.
function varargout = UTS_Fahmi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in push1.
function push1_Callback(hObject, eventdata, handles)
% hObject    handle to push1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file,nama_path] = uigetfile('*.*', 'Pick an image'); %Fungsi untuk mendapatkan lokasi file
if ~isequal(nama_file,0)
    img = imread(fullfile(nama_path,nama_file));           %fungsi untuk membaca dan menyimpan file gambar pada path
    axes(handles.axes1)                                    % menyimpan kedalam axes
    imshow(img)                                            % menampilkan gambar pada axes
    title ('Citra RGB');
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);
else
    return
end
handles.img = img;                                         % untuk memisahkan gambar menjari RED,GREEN,BLUE
handles.R = R;
handles.G = G;
handles.B = B;
guidata(hObject, handles)

red=mean(mean(img(:,:,1)));                                % untuk menampilkan Nilai RED dari citra asli
green=mean(mean(img(:,:,2)));                              % untuk menampilkan Nilai GREEN dari citra asli
blue=mean(mean(img(:,:,3)));                               % untuk menampilkan Nilai BLUE dari citra asli

set(handles.edit1,'string',red);
set(handles.edit2,'string',green);
set(handles.edit3,'string',blue);

% --- Executes on button press in rb1.
function rb1_Callback(hObject, eventdata, handles)
% hObject    handle to rb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb1
set(hObject,'Value',1)              % mengaktifkan fungsi radio button
set(handles.rb2,'value',0)          % mematikan fungsi  
set(handles.rb3,'value',0)          % mematikan fungsi  
set(handles.rb4,'value',0)          % mematikan fungsi  
set(handles.rb5,'value',0)          % mematikan fungsi  
img = handles.img;                  % memanggil gambar yang sudah dibaca push buttton 1 / Pilih Gambar
R = handles.R;
G = handles.G;
B = handles.B;
axes(handles.axes1)
imshow(img)
title('Citra RGB')
axes(handles.axes2)
h = histogram(R,256)                % menampilkan histogram RED
h.FaceColor = 'r';
h.EdgeColor = 'r';
xlim([0,255])
grid on
hold on
h = histogram(G,256)                % menampilkan histogram GREEN
h.FaceColor = 'g';
h.EdgeColor = 'g';
xlim([0,255])
grid on
h = histogram(B,256)                % menampilkan histogram BLUE
h.FaceColor = 'b';
h.EdgeColor = 'b';
xlim([0,255])
grid on
hold off
title('Histogram RGB')


% --- Executes on button press in rb2.
function rb2_Callback(hObject, eventdata, handles)
% hObject    handle to rb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb2
set(hObject,'Value',1)              % mengaktifkan fungsi radio button
set(handles.rb1,'value',0)          % mematikan fungsi  
set(handles.rb3,'value',0)          % mematikan fungsi  
set(handles.rb4,'value',0)          % mematikan fungsi  
set(handles.rb5,'value',0)          % mematikan fungsi  
R = handles.R;
G = handles.G;
B = handles.B;
axes(handles.axes1)
Red = cat(3,R,G*0,B*0);
imshow(Red)
title('Citra RED')
axes(handles.axes2)
h = histogram(R,256)                % menampilkan histogram RED
h.FaceColor = 'r';
h.EdgeColor = 'r';
xlim([0,255])
grid on
title('Histogram Citra RED')


% --- Executes on button press in rb3.
function rb3_Callback(hObject, eventdata, handles)
% hObject    handle to rb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb3
set(hObject,'Value',1)              % mengaktifkan fungsi radio button
set(handles.rb1,'value',0)          % mematikan fungsi  
set(handles.rb2,'value',0)          % mematikan fungsi  
set(handles.rb4,'value',0)          % mematikan fungsi  
set(handles.rb5,'value',0)          % mematikan fungsi   
R = handles.R;
G = handles.G;
B = handles.B;
axes(handles.axes1)
Green = cat(3,R*0,G,B*0);
imshow(Green)
title('Citra GREEN')
axes(handles.axes2)
h = histogram(G,256)                % menampilkan histogram GREEN
h.FaceColor = 'g';
h.EdgeColor = 'g';
xlim([0,255])
grid on
title('Histogram Citra GREEN')

% --- Executes on button press in rb4.
function rb4_Callback(hObject, eventdata, handles)
% hObject    handle to rb4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb4
set(hObject,'Value',1)              % mengaktifkan fungsi radio button
set(handles.rb1,'value',0)          % mematikan fungsi  
set(handles.rb2,'value',0)          % mematikan fungsi  
set(handles.rb3,'value',0)          % mematikan fungsi  
set(handles.rb5,'value',0)          % mematikan fungsi  
R = handles.R;
G = handles.G;
B = handles.B;
axes(handles.axes1)
Blue = cat(3,R*0,G*0,B);
imshow(Blue)
title('Citra BLUE')
axes(handles.axes2)
h = histogram(B,256)                % menampilkan histogram BLUE
h.FaceColor = 'b';
h.EdgeColor = 'b';
xlim([0,255])
grid on
title('Histogram Citra GREEN')

% --- Executes on button press in rb5.
function rb5_Callback(hObject, eventdata, handles)
% hObject    handle to rb5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb5
set(hObject,'Value',1)              % mengaktifkan fungsi radio button
set(handles.rb1,'value',0)          % mematikan fungsi  
set(handles.rb2,'value',0)          % mematikan fungsi  
set(handles.rb3,'value',0)          % mematikan fungsi  
set(handles.rb4,'value',0)          % mematikan fungsi  
img = handles.img;
Gray = rgb2gray(img);               % merubah RGB ke Grayscale
axes(handles.axes1)
imshow(Gray)
title('Citra GRAYSCALE')
axes(handles.axes2)
h = histogram(Gray,256)             % menampilkan histogram GRAYSCALE
h.FaceColor = [.5 .5 .5];           % untuk mendapatkan warna yang mendekati Abu Abu
h.EdgeColor = [.5 .5 .5];
xlim([0,255])
grid on
title('Histogram Citra GRAYSCALE')


% --- Executes on button press in push2.
function push2_Callback(hObject, eventdata, handles)
% hObject    handle to push2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
close();



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


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


% --- Executes on slider movement.
function brightness_Callback(hObject, eventdata, handles)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a = handles.img;                     
b = get(hObject,'Value');
c = imadd(a,b);
axes(handles.axes1);
imshow(c);
title('Brightness Citra Asli')

% --- Executes during object creation, after setting all properties.
function brightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in push3.
function push3_Callback(hObject, eventdata, handles)
% hObject    handle to push3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
F = getframe(handles.axes1);        % fungsi untuk mendapatkan gambar pada axes1
Image = frame2im(F);
imwrite(Image, 'Image.jpg')         %fungsi untuk menyimpan gambar pada folder
