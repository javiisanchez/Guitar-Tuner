f  = 500;
Fs=8000
frame= 0.9*sin(2*pi*f/Fs*(1:4096));

[frame,Fs]=audioread('1st_String_E.mp3');
frame=frame(9.158e+04:9.158e+04+4096);
X = xcorr(frame,160,'coeff'); 

X=X(160+1:2*160+1); 
plot(X)


[Xmax,i]=max(X(8:end));

%Period    
P = (8+i-2)

%Pitch Test, this result need be near or equal f
Fs/P