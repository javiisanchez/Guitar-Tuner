
Nfft=1024;          %N of fft
freqCut=330;        %The maximum frequency that I need to identificated all notes of a guitar.
Mdelmat=45;         %Number of reduce to obain good resolution

% Take the mp3 audio or wav audios and save in a vector
audiomp3vector={'1st_String_E.mp3' '2nd_String_B.mp3' '3rd_String_G.mp3' '4th_String_D.mp3' '5th_String_A.mp3' '6th_String_E.mp3'};
stringvector={'E=329,62Hz' 'B=246,94Hz' 'G=195,99Hz' 'D=146,83Hz' 'A=110Hz' 'E=82,4Hz'};

% Read mp3 with Fs=44100 Hz
%for i=1:length(audiomp3vector)
i=1;
    [y,Fs]=audioread(audiomp3vector{i});
    fig=figure();
    plot(y);
    title('Select initial position to crop');
    dcm_obj=datacursormode(fig);
    set(dcm_obj,'DisplayStyle','datatip',...
    'SnapToDataVertex','off','Enable','on')
    disp('Click line to display a data tip.')
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
    ydownsamplednofilter=downsample(ynova,Mdelmat);
    
% FFT 1024
    novafreq=Fs/Mdelmat;
    fftambfiltre=abs(fft(ydownsampled,Nfft));
    fftsensefiltre=abs(fft(ydownsamplednofilter,Nfft));
    freqaxis=novafreq*(0:(Nfft/2))/Nfft;

if(i==1)
    f=figure();
    set(f,'name','Guitar signal analysis','numbertitle','off');
    tabgp = uitabgroup(f);
end
tab1 = uitab('parent',tabgp,'Title',stringvector{i});
axes('parent',tab1);

subplot(1,3,1);
    plot(y);
    title('Original signal');

subplot(2,3,2);
    plot(ydownsamplednofilter);
    title('Downsampled signal without filter');
    
subplot(2,3,3);
    plot(ydownsampled);
    title('Downsampled signal with filter');
    
subplot(2,3,5);
    plot(freqaxis,fftsensefiltre(1:(Nfft/2)+1));
    title('Fft downsampled signal');
    
subplot(2,3,6);
    plot(freqaxis,fftambfiltre(1:(Nfft/2)+1));
    title('Fft downsampled signal');
%end