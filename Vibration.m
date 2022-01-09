%Initialising known physical properties - masses and eccentricity
m=0.1;
e=0.2;
M=50;

xi=0.01; %Damping ratio
wn=146.88*60/2/pi; %Calculating natural frequency
w=linspace(600,2400,100); %Interested range of frequencies
Yop=zeros(100); %Amplitude of output
phase=zeros(100); %Phase of Output

%Compute amplitude and phase
for(i=1:100)
    r=w(i)/wn;
    Yop(i)=1000*(m*e/M)*r*r/sqrt((1-r*r)^2+4*xi*xi*r*r);
    phase(i)=-atan(2*xi*r/(1-r*r));
end

subplot(2,1,1);
semilogx(w,Yop);
ylabel("Amplitude of response (mm)");
xlabel("Frequency (rpm)");
grid ON;

subplot(2,1,2);
semilogx(w,phase);
ylabel("Phase (rad)");
xlabel("Frequency (rpm)");
grid ON;