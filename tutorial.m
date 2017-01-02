function varargout = tutorial(varargin)
% TUTORIAL MATLAB code for tutorial.fig
%      TUTORIAL, by itself, creates a new TUTORIAL or raises the existing
%      singleton*.
%
%      H = TUTORIAL returns the handle to a new TUTORIAL or the handle to
%      the existing singleton*.
%
%      TUTORIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUTORIAL.M with the given input arguments.
%
%      TUTORIAL('Property','Value',...) creates a new TUTORIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tutorial_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tutorial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tutorial

% Last Modified by GUIDE v2.5 26-May-2016 21:08:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tutorial_OpeningFcn, ...
                   'gui_OutputFcn',  @tutorial_OutputFcn, ...
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


% --- Executes just before tutorial is made visible.
function tutorial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tutorial (see VARARGIN)

% Choose default command line output for tutorial

axes(handles.axes1)
axes(handles.axes2)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tutorial wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tutorial_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure



% --- Executes on button press in E.
function E_Callback(hObject, eventdata, handles)
% hObject    handle to E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = get(hObject,'Value');
if a==1
	
    Fmostreig = 2000;   % Hz
    Twindow = 200e-3;   % segons
    Amplitud = 10;
    Nfft=1024;          % Potencia de dos

    % Vector de temps
    n=0:1/Fmostreig:Twindow;

    frequencia=82.4069;
    senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
    primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
    segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
    tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
    quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);

    % Created a signal and a noise signal
    signal=senyalFonamental+primerHarmonic+segonHarmonic+tercerHarmonic+quartHarmonic;

    threshold=0.8*(Amplitud*length(n)/2);
    f=Fmostreig*(0:(Nfft/2))/Nfft;

    transformtoplot=abs(fft(signal,Nfft));
    pitch=Fmostreig*(find(transformtoplot>threshold,1)-1)/Nfft;

    xlabel('Time (s)');
    title('X(t)');
    plot(handles.axes1,n,signal);


    plot(handles.axes2, f,transformtoplot(1:(Nfft/2)+1));
    line([0 f(end)],[threshold threshold],'LineStyle','--','Color','r');
    text(Fmostreig/2,threshold,'\leftarrow Threshold');
    xlabel('Frequency (Hz)');
    title(['FFT(X(t)).Pitch = ',num2str(pitch)]);
    
else
	plot(handles.axes1,0,0);
    plot(handles.axes2, 0,0);
end

guidata(hObject, handles);

% --- Executes on button press in A.
function A_Callback(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');

if a==1
    Fmostreig = 2000;   % Hz
    Twindow = 200e-3;   % segons
    Amplitud = 10;
    SNR=3;              % dB
    Nfft=1024;          % Potencia de dos

    % Vector de temps
    n=0:1/Fmostreig:Twindow;

    frequencia=110;
    senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
    primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
    segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
    tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
    quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);

    % Created a signal and a noise signal
    signal=senyalFonamental+primerHarmonic+segonHarmonic+tercerHarmonic+quartHarmonic;
    signalWithNoise = awgn(signal,SNR,'measured');

    threshold=0.8*(Amplitud*length(n)/2);
    f=Fmostreig*(0:(Nfft/2))/Nfft;

    transformtoplot=abs(fft(signal,Nfft));
    pitch=Fmostreig*(find(transformtoplot>threshold,1)-1)/Nfft;

    xlabel('Time (s)');
    title('X(t)');
    plot(handles.axes1,n,signal);


    plot(handles.axes2, f,transformtoplot(1:(Nfft/2)+1));
    line([0 f(end)],[threshold threshold],'LineStyle','--','Color','r');
    text(Fmostreig/2,threshold,'\leftarrow Threshold');
    xlabel('Frequency (Hz)');
    title(['FFT(X(t)).Pitch = ',num2str(pitch)]);
else
	plot(handles.axes1,0,0);
    plot(handles.axes2, 0,0);
end
guidata(hObject, handles);


% --- Executes on button press in D.
function D_Callback(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');

if a==1
    Fmostreig = 2000;   % Hz
    Twindow = 200e-3;   % segons
    Amplitud = 10;
    SNR=3;              % dB
    Nfft=1024;          % Potencia de dos

    % Vector de temps
    n=0:1/Fmostreig:Twindow;

    frequencia=146.8324;
    senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
    primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
    segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
    tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
    quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);

    % Created a signal and a noise signal
    signal=senyalFonamental+primerHarmonic+segonHarmonic+tercerHarmonic+quartHarmonic;
    signalWithNoise = awgn(signal,SNR,'measured');

    threshold=0.8*(Amplitud*length(n)/2);
    f=Fmostreig*(0:(Nfft/2))/Nfft;

    transformtoplot=abs(fft(signal,Nfft));
    pitch=Fmostreig*(find(transformtoplot>threshold,1)-1)/Nfft;

    xlabel('Time (s)');
    title('X(t)');
    plot(handles.axes1,n,signal);


    plot(handles.axes2, f,transformtoplot(1:(Nfft/2)+1));
    line([0 f(end)],[threshold threshold],'LineStyle','--','Color','r');
    text(Fmostreig/2,threshold,'\leftarrow Threshold');
    xlabel('Frequency (Hz)');
    title(['FFT(X(t)).Pitch = ',num2str(pitch)]);
else
	plot(handles.axes1,0,0);
    plot(handles.axes2, 0,0);
end

guidata(hObject, handles);


% --- Executes on button press in ep.
function ep_Callback(hObject, eventdata, handles)
% hObject    handle to ep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = get(hObject,'Value');
if a==1
    Fmostreig = 2000;   % Hz
    Twindow = 200e-3;   % segons
    Amplitud = 10;
    SNR=3;              % dB
    Nfft=1024;          % Potencia de dos

    % Vector de temps
    n=0:1/Fmostreig:Twindow;

    frequencia=329.6277;
    senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
    primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
    segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
    tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
    quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);

    % Created a signal and a noise signal
    signal=senyalFonamental+primerHarmonic+segonHarmonic+tercerHarmonic+quartHarmonic;
    signalWithNoise = awgn(signal,SNR,'measured');

    threshold=0.8*(Amplitud*length(n)/2);
    f=Fmostreig*(0:(Nfft/2))/Nfft;

    transformtoplot=abs(fft(signal,Nfft));
    pitch=Fmostreig*(find(transformtoplot>threshold,1)-1)/Nfft;

    xlabel('Time (s)');
    title('X(t)');
    plot(handles.axes1,n,signal);


    plot(handles.axes2, f,transformtoplot(1:(Nfft/2)+1));
    line([0 f(end)],[threshold threshold],'LineStyle','--','Color','r');
    text(Fmostreig/2,threshold,'\leftarrow Threshold');
    xlabel('Frequency (Hz)');
    title(['FFT(X(t)).Pitch = ',num2str(pitch)]);
else
	plot(handles.axes1,0,0);
    plot(handles.axes2, 0,0);
end

guidata(hObject, handles);


% --- Executes on button press in B.
function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = get(hObject,'Value');
if a==1
    Fmostreig = 2000;   % Hz
    Twindow = 200e-3;   % segons
    Amplitud = 10;
    SNR=3;              % dB
    Nfft=1024;          % Potencia de dos

    % Vector de temps
    n=0:1/Fmostreig:Twindow;

    frequencia=246.9417;
    senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
    primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
    segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
    tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
    quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);

    % Created a signal and a noise signal
    signal=senyalFonamental+primerHarmonic+segonHarmonic+tercerHarmonic+quartHarmonic;
    signalWithNoise = awgn(signal,SNR,'measured');

    threshold=0.8*(Amplitud*length(n)/2);
    f=Fmostreig*(0:(Nfft/2))/Nfft;

    transformtoplot=abs(fft(signal,Nfft));
    pitch=Fmostreig*(find(transformtoplot>threshold,1)-1)/Nfft;

    xlabel('Time (s)');
    title('X(t)');
    plot(handles.axes1,n,signal);


    plot(handles.axes2, f,transformtoplot(1:(Nfft/2)+1));
    line([0 f(end)],[threshold threshold],'LineStyle','--','Color','r');
    text(Fmostreig/2,threshold,'\leftarrow Threshold');
    xlabel('Frequency (Hz)');
    title(['FFT(X(t)).Pitch = ',num2str(pitch)]);
else
	plot(handles.axes1,0,0);
    plot(handles.axes2, 0,0);
end

guidata(hObject, handles);

% --- Executes on button press in G.
function G_Callback(hObject, eventdata, handles)
% hObject    handle to G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');

if a==1
    Fmostreig = 2000;   % Hz
    Twindow = 200e-3;   % segons
    Amplitud = 10;
    SNR=3;              % dB
    Nfft=1024;          % Potencia de dos

    % Vector de temps
    n=0:1/Fmostreig:Twindow;

    frequencia=195.9978;
    senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
    primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
    segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
    tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
    quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);

    % Created a signal and a noise signal
    signal=senyalFonamental+primerHarmonic+segonHarmonic+tercerHarmonic+quartHarmonic;
    signalWithNoise = awgn(signal,SNR,'measured');

    threshold=0.8*(Amplitud*length(n)/2);
    f=Fmostreig*(0:(Nfft/2))/Nfft;

    transformtoplot=abs(fft(signal,Nfft));
    pitch=Fmostreig*(find(transformtoplot>threshold,1)-1)/Nfft;

    xlabel('Time (s)');
    title('X(t)');
    plot(handles.axes1,n,signal);


    plot(handles.axes2, f,transformtoplot(1:(Nfft/2)+1));
    line([0 f(end)],[threshold threshold],'LineStyle','--','Color','r');
    text(Fmostreig/2,threshold,'\leftarrow Threshold');
    xlabel('Frequency (Hz)');
    title(['FFT(X(t)).Pitch = ',num2str(pitch)]);
else
	plot(handles.axes1,0,0);
    plot(handles.axes2, 0,0);
end

guidata(hObject, handles);

% --- Executes on button press in tuner.
function tuner_Callback(hObject, eventdata, handles)
% hObject    handle to tuner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
close all;
GUITAR_TUNER;

