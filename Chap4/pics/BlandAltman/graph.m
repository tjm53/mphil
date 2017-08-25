clear all
close all

%test1 -> phi=2.8
%test3 -> phi=4.7
%test5 -> phi=5.3
%test6 -> phi=5.7


%files = {'quiet','p=3','p=4','p=5','p=6'};

%path = 'TEST/r=0.2,a=0.05/';
path = 'TEST/';

%files = {'quiet','p=4,a=0.025','p=4,a=0.05','p=4,a=0.075','p=4,r=0.15','p=4,r=0.2','p=4,r=0.25'};
%files = {'quiet','p=3,r=0.15','p=3,r=0.2','p=3,r=0.25'};

%files = {'quiet','p=3,a=0.025','p=3,a=0.05','p=3,a=0.075','p=4,a=0.025','p=4,a=0.05','p=4,a=0.075','p=5,a=0.025','p=5,a=0.05','p=5,a=0.075'};
files = {'quiet','p=3,r=0.15','p=3,r=0.2','p=3,r=0.25','p=4,r=0.15','p=4,r=0.2','p=4,r=0.25','p=5,r=0.15','p=5,r=0.2','p=5,r=0.25'};


color = {'b','g','r','c','m','y','k','b--','g--','r--','c--','m--','y--','k--','b-.','g-.','r-.','c-.','m-.','y-.','k-.'};

size_files = size(files,2);
figure
for i=1:size_files
    
    load ([path,files{1,i},'/',files{1,i},'.mat']);
    
    plot(error_frame(1,:),color{1,i});
    
    leg{1,i} = [files{1,i},'; mse =  ',num2str(mse)];
    
    hold on
end

legend(leg{1,:})




cycle = 250;
pulse = 2*pi/cycle;
frames = 1:1:500;
phase = 2.8;
%phase = 4.7;
contract = 8;
offset = 40;

sine = offset-contract/2*(sin( frames * pulse + phase) + 1 );

%plot(frames,sine)