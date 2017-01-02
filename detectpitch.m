Nfft=1024;          %N of fft
freqCut=330;        %The maximum frequency that I need to identificated all notes of a guitar.
Mdelmat=45;         %Number of reduce to obain good resolution
Amplitud=10;
% Take the mp3 audio or wav audios and save in a vector
audiomp3vector={'1st_String_E.mp3' '2nd_String_B.mp3' '3rd_String_G.mp3' '4th_String_D.mp3' '5th_String_A.mp3' '6th_String_E.mp3'};
stringvector={'E=329,62Hz' 'B=246,94Hz' 'G=195,99Hz' 'D=146,83Hz' 'A=110Hz' 'e=82,4Hz'};

% Read mp3 with Fs=44100 Hz

mp3note=1;
    [y,Fs]=audioread(audiomp3vector{mp3note});
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

    f=figure();
    set(f,'name','Guitar signal analysis','numbertitle','off');
    tabgp = uitabgroup(f);

    tab1 = uitab('parent',tabgp,'Title',stringvector{mp3note});
    axes('parent',tab1);
    
    threshold = 2.2;
    pitch=novafreq*(find(fftambfiltre>threshold,1)-1)/Nfft;
    
    if (pitch < 40)
        disp('the guitar is out of tune')
    end
    if (pitch >= 40 && pitch <= 96.2)
        disp('You stay tun the peg e') 
        disp('The Freq. of note is: e=82,4Hz')
        
        if (pitch >= 81.5 && pitch <= 83.5)
            disp('The note is tune') 
        else disp('The note is out of tone, turn the peg ')
        end
    end
    if (pitch > 96.2 && pitch <= 128.5)
        disp('You stay tun the note A') 
        disp('The freq. of note is: A=110Hz')
        if (pitch >= 109 && pitch <= 111)
            disp('The note is tune') 
        else disp('The note is out of tone, turn the peg ')
        end
    end
    if (pitch > 128.5 && pitch <= 170)
        disp('You stay tun the note D')
        disp('The freq. of note is: D=146,83Hz')
        if (pitch >= 144.5 && pitch <= 148)
            disp('The note is tune') 
        else disp('The note is out of tone, turn the peg ')
        end
    end
    if (pitch > 170 && pitch <= 227)
        disp('You stay tun the note G')
        disp('The freq. of note is: G=195,99Hz')
        if (pitch >= 194.5 && pitch <= 197)
            disp('The note is tune') 
        else disp('The note is out of tone, turn the peg ')
        end
    end
    if (pitch > 227 && pitch <= 287)
        disp('You stay tun the note B')
        disp('The freq. of note is: B=246,94Hz')
        if (pitch >= 245 && pitch <= 248)
            disp('The note is tune') 
        else disp('The note is out of tone, turn the peg ')
        end
    end
    if (pitch > 287 && pitch <= 360)
        disp('You stay tun the note E')
        disp('The freq. of note is: E=329,62Hz') 
        if (pitch >= 328 && pitch <= 330.5)
            disp('The note is tune') 
        else disp('The note is out of tone, turn the peg ')
        end
    end
    
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
