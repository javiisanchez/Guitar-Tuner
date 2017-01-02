%% GUITAR TUNER

%% Variables
Nota='E';           % E,A,D,G,B,e      
Fmostreig = 2000;   % Hz
Twindow = 200e-3;   % segons
Amplitud = 10;
SNR=3;              % dB
Nfft=1024;          % Potencia de dos

%% CORE
% Vector de temps
n=0:1/Fmostreig:Twindow;
% Switch segons la nota
switch Nota
    case 'E'
        frequencia=82.4069;
        senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
        primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
        segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
        tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
        quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);
    case 'A'
        frequencia=110;
        senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
        primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
        segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
        tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
        quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);
    case 'D'
        frequencia=146.8324;
        senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
        primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
        segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
        tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
        quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);
    case 'G'
        frequencia=195.9978;
        senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
        primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
        segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
        tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
        quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);
    case 'B'
        frequencia=246.9417;
        senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
        primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
        segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
        tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
        quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);
    case 'e'
        frequencia=329.6277;
        senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
        primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
        segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
        tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
        quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);
    otherwise
        frequencia=1000;
        senyalFonamental=Amplitud*cos(2*pi*(frequencia)*n);
        primerHarmonic=1.25*Amplitud*cos(2*pi*(2*frequencia)*n);
        segonHarmonic=0.75*Amplitud*cos(2*pi*(3*frequencia)*n);
        tercerHarmonic=0.4*Amplitud*cos(2*pi*(4*frequencia)*n);
        quartHarmonic=0.15*Amplitud*cos(2*pi*(5*frequencia)*n);
end
% Created a signal and a noise signal
signal=senyalFonamental+primerHarmonic+segonHarmonic+tercerHarmonic+quartHarmonic;
signalWithNoise = awgn(signal,SNR,'measured');
%% GUI
stringTitle=['Nota:',Nota,'. Freqüència=',num2str(frequencia),'Hz'];
f=figure;
    set(f,'name',stringTitle,'numbertitle','off');
    tabgp = uitabgroup(f);
    
threshold=0.8*(Amplitud*length(n)/2);
f=Fmostreig*(0:(Nfft/2))/Nfft;

tab1 = uitab('parent',tabgp,'Title','Signal');
axes('parent',tab1);

transformtoplot=abs(fft(signal,Nfft));
pitch=Fmostreig*(find(transformtoplot>threshold,1)-1)/Nfft;

subplot(1,2,1);
    plot(n,signal);
    xlabel('Time (s)');
    title('X(t)');

subplot(1,2,2);
    plot(f,transformtoplot(1:(Nfft/2)+1));
    line([0 f(end)],[threshold threshold],'LineStyle','--','Color','r');
    text(Fmostreig/2,threshold,'\leftarrow Threshold');
    xlabel('Frequency (Hz)');
    title(['FFT(X(t)).Pitch = ',num2str(pitch)]);

tab2 = uitab('parent',tabgp,'Title','Signal + White Noise');
axes('parent',tab2);

transformtoPlotNoise=abs(fft(signalWithNoise,Nfft));
pitchNoise=Fmostreig*(find(transformtoPlotNoise>threshold,1)+2)/Nfft;

subplot(1,2,1);
    plot(n,signalWithNoise);
    xlabel('Time (s)');
    title('X(t)+w(t)');
subplot(1,2,2);
    plot(f,transformtoPlotNoise(1:(Nfft/2)+1));
    line([0 f(end)],[threshold threshold],'LineStyle','--','Color','r');
    text(Fmostreig/2,threshold,'\leftarrow Threshold');
    xlabel('Frequency (Hz)');
    title(['FFT(X(t)+w(t)).Pitch = ',num2str(pitchNoise)]);