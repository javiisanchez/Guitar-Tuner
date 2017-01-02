function varargout = GUITAR_TUNER(varargin)
% GUITAR_TUNER MATLAB code for GUITAR_TUNER.fig
%      GUITAR_TUNER, by itself, creates a new GUITAR_TUNER or raises the existing
%      singleton*.
%
%      H = GUITAR_TUNER returns the handle to a new GUITAR_TUNER or the handle to
%      the existing singleton*.
%
%      GUITAR_TUNER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUITAR_TUNER.M with the given input arguments.
%
%      GUITAR_TUNER('Property','Value',...) creates a new GUITAR_TUNER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUITAR_TUNER_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUITAR_TUNER_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUITAR_TUNER

% Last Modified by GUIDE v2.5 24-May-2016 23:52:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUITAR_TUNER_OpeningFcn, ...
                   'gui_OutputFcn',  @GUITAR_TUNER_OutputFcn, ...
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


% --- Executes just before GUITAR_TUNER is made visible.
function GUITAR_TUNER_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUITAR_TUNER (see VARARGIN)

% Choose default command line output for GUITAR_TUNER

handles.output = hObject;
handles.playfiles = [];           % Playlist files
axes(handles.grafica1)
image = imread('peg.jpg');   
axis off;
imshow(image);

axes(handles.axes3)
image = imread('peg.jpg');   
axis off;
imshow(image);

axes(handles.axes4)
image = imread('peg.jpg');   
axis off;
imshow(image);

axes(handles.axes5)
image = imread('peg1.jpg');   
axis off;
imshow(image);

axes(handles.axes6)
image = imread('peg1.jpg');   
axis off;
imshow(image);

axes(handles.axes7)
image = imread('peg1.jpg');   
axis off;
imshow(image);

axes(handles.plot1)
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUITAR_TUNER wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUITAR_TUNER_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in D.
function D_Callback(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pitch=handles.pitch;

a = get(hObject,'Value');
if a==1
    if (pitch >= 144.5 && pitch <= 148)
        set(handles.updown,'String','Your guitar is Tune');
    elseif (pitch <148)
        set(handles.updown,'String','Turn little left the "D" PEG');
    else set(handles.updown,'String','Turn little right the "D" PEG');
    end
else 
    set(handles.updown,'String',' ');
end
% Hint: get(hObject,'Value') returns toggle state of D


% --- Executes on button press in e_peg.
function e_peg_Callback(hObject, eventdata, handles)
% hObject    handle to e_peg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pitch=handles.pitch;

a = get(hObject,'Value');
if a==1
    if (pitch >= 81.5 && pitch <= 83.5)
        set(handles.updown,'String','Your guitar is Tune');
    elseif (pitch <83.5)
        set(handles.updown,'String','Turn little left the "e" PEG');
    else set(handles.updown,'String','Turn little right the "e" PEG');
    end
else 
    set(handles.updown,'String',' ');
end


% Hint: get(hObject,'Value') returns toggle state of e_peg


% --- Executes on button press in A.
function A_Callback(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pitch=handles.pitch;
a = get(hObject,'Value');
if a==1
    if (pitch >= 109 && pitch <= 111)
        set(handles.updown,'String','Your guitar is Tune');
    elseif (pitch <111)
        set(handles.updown,'String','Turn little left the "A" PEG');
    else set(handles.updown,'String','Turn little right the "A" PEG');
    end
else 
    set(handles.updown,'String',' ');
end

% Hint: get(hObject,'Value') returns toggle state of A


% --- Executes on button press in E.
function E_Callback(hObject, eventdata, handles)
% hObject    handle to E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pitch=handles.pitch;
a = get(hObject,'Value');
if a==1
    if (pitch >= 328 && pitch <= 330.5)
        set(handles.updown,'String','Your guitar is Tune');
    elseif (pitch <330.5)
        set(handles.updown,'String','Turn little left the "E" PEG');
    else set(handles.updown,'String','Turn little right the "E" PEG');
    end
else 
    set(handles.updown,'String',' ');
end
    
% Hint: get(hObject,'Value') returns toggle state of E


% --- Executes on button press in B.
function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pitch=handles.pitch;
a = get(hObject,'Value');
if a==1
    if (pitch >= 245 && pitch <= 248)
        set(handles.updown,'String','Your guitar is Tune');
    elseif (pitch <248)
        set(handles.updown,'String','Turn little left the "B" PEG');
    else set(handles.updown,'String','Turn little right the "B" PEG');
    end
else 
    set(handles.updown,'String',' ');
end
    
% Hint: get(hObject,'Value') returns toggle state of B


% --- Executes on button press in G.
function G_Callback(hObject, eventdata, handles)
% hObject    handle to G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pitch=handles.pitch;
a = get(hObject,'Value');
if a==1
    if (pitch >= 194.5 && pitch <= 197)
        set(handles.updown,'String','Your guitar is Tune');
    elseif (pitch <197)
        set(handles.updown,'String','Turn little left the "G" PEG');
    else set(handles.updown,'String','Turn little right the "G" PEG');
    end
else 
    set(handles.updown,'String',' ');
end

% Hint: get(hObject,'Value') returns toggle state of G



function Howpeg_Callback(hObject, eventdata, handles)
% hObject    handle to Howpeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Howpeg as text
%        str2double(get(hObject,'String')) returns contents of Howpeg as a double


% --- Executes during object creation, after setting all properties.
function Howpeg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Howpeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Pegstay_Callback(hObject, eventdata, handles)
% hObject    handle to Pegstay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pegstay as text
%        str2double(get(hObject,'String')) returns contents of Pegstay as a double


% --- Executes during object creation, after setting all properties.
function Pegstay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pegstay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Add_mp3.
function Add_mp3_Callback(hObject, eventdata, handles)
% hObject    handle to Add_mp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cnt=get(handles.Add_mp3,'UserData');              % To update the ID3 tag index
[f g]=uigetfile ('*.mp3','Choose a MP3 File','MultiSelect', 'on');  % Choose mp3 file to add to play list
p=get(handles.playlist,'String');             
p{length(p)+1}=(f);
set(handles.playlist,'String',p);               % Update the playlist display
handles.playfiles{length(handles.playfiles)+1}=[g f];
s = which('mp3read.m');
ww = strfind('mp3read.m',s);
location = s(1:ww-2);

guidata(hObject,handles);





% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Nfft=1024;          %N of fft
freqCut=330;        %The maximum frequency that I need to identificated all notes of a guitar.
Mdelmat=45;         %Number of reduce to obain good resolution
Amplitud=10;

v = get (handles.playlist, 'Value');    % Get current playlist position
pause(0.1);
cfile = handles.playfiles{v};           % Get selected files's path
[y, Fs] = audioread(cfile);              % Decode selected mp3 file.
fig=figure();
plot(y);
title('Select initial position to crop');
dcm_obj=datacursormode(fig);
set(dcm_obj,'DisplayStyle','datatip',...
'SnapToDataVertex','off','Enable','on')
% Wait while the user does this.
pause 
% Make selected line wider
%waitforbuttonpress;
c_info=getCursorInfo(dcm_obj);
crop=roundn(c_info.Position(1),1);
delete(fig);

%filter
    [b,a]=butter(2,2*(freqCut/44100),'low');
    
% Crop and downsample and GUI
    ynova=y(crop:crop+45055);           %new vector
    yfiltered=filter(b,a,ynova);        %vector filtered
    yfiltered=filter(b,a,yfiltered);    %Filtered again
    ydownsampled=downsample(yfiltered,Mdelmat); 
    %ydownsamplednofilter=downsample(ynova,Mdelmat);
    
% FFT 1024
    novafreq=Fs/Mdelmat;
    fftambfiltre=abs(fft(ydownsampled,Nfft));
    freqaxis=novafreq*(0:(Nfft/2))/Nfft;
    
    threshold = 2.2;
    pitch1=novafreq*(find(fftambfiltre>threshold,1)-1)/Nfft;
    handles.pitch = pitch1;
    pitch = handles.pitch;
    if (pitch < 40)
        set(handles.pegstay,'String','the guitar is out of tune');
        set(handles.Howpeg,'String','The Frequency is invalid');
        set(handles.updown,'String','Try with other mp3 file');
    end
    if (pitch >= 40 && pitch <= 96.2)
        set(handles.Pegstay,'String','You stay tun the peg e');
        set(handles.Howpeg,'String','The Freq. of the string is e=82,4Hz please select your PEG');
    end
    if (pitch > 96.2 && pitch <= 128.5)
        set(handles.Pegstay,'String','You stay tun the peg A');
        set(handles.Howpeg,'String','The Freq. of the string is A=110 Hz please select your PEG');
    end
    if (pitch > 128.5 && pitch <= 170)
        set(handles.Pegstay,'String','You stay tun the peg D');
        set(handles.Howpeg,'String','The Freq. of the string is D=146,83 Hz please select your PEG');
    end
    if (pitch > 170 && pitch <= 227)
        set(handles.Pegstay,'String','You stay tun the peg G');
        set(handles.Howpeg,'String','The Freq. of the string is G=195,99 Hz please select your PEG');
    end
    if (pitch > 227 && pitch <= 287)
        set(handles.Pegstay,'String','You stay tun the peg B');
        set(handles.Howpeg,'String','The Freq. of the string is B=246,94 Hz please select your PEG');
    end
    if (pitch > 287 && pitch <= 360)
        set(handles.Pegstay,'String','You stay tun the peg E');
        set(handles.Howpeg,'String','The Freq. of the string is E=329.62 Hz please select your PEG'); 
    end
    if (pitch > 360)
        set(handles.pegstay,'String','the guitar is out of tune');
        set(handles.Howpeg,'String','The Frequency is invalid');
        set(handles.updown,'String','Try with other mp3 file');
    end
handles.ejex = freqaxis;
yl = fftambfiltre;
plot(handles.ejex, yl(1:(Nfft/2)+1));
guidata(hObject, handles);


% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
close all;

% --- Executes on selection change in playlist.
function playlist_Callback(hObject, eventdata, handles)
% hObject    handle to playlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns playlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from playlist


% --- Executes during object creation, after setting all properties.
function playlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to playlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function updown_Callback(hObject, eventdata, handles)
% hObject    handle to updown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of updown as text
%        str2double(get(hObject,'String')) returns contents of updown as a double


% --- Executes during object creation, after setting all properties.
function updown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to updown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
