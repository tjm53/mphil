

%trendplot
    l=[500,980,1490,1900,2350,2790];
    l1=[l(2)-l(1),l(3)-l(2),l(4)-l(3),l(5)-l(4),l(6)-l(5)];
    
    m=min(l1);
    
    b1=file(l(1):(l(1)+m));
    b2=file(l(2):(l(2)+m));
    b3=file(l(3):(l(3)+m));
    b4=file(l(4):(l(4)+m));
    b5=file(l(5):(l(5)+m));
    b6=file(l(6):(l(6)+m));
    
    b=(b1+b2+b3+b4+b5+b6)/6;
    b=b';
    
    
    x2=(1:1:size(b))';
    [poly6_fit]=trendplot(x2,b);
    new_c=(poly6_fit+file(:,1))/2;
    figure
    plot(x2,new_c,x2,b);
    
    


%tracer courbes experience
    x=(1:1:1000)/40;
    plot(x,file(1:1000,1:2));
    legend('simulation','spirogram');
    xlabel('time (s)');
    ylabel('V_{lungs} (L)');



%tracer courbes individu  
    x=(1:1:1000)/40;
    pers = 'th';
    ex={'_stan_q','_stan_f','_sit_q','_sit_f','_l_q','_l_f'};
    color = {'b','g','r','c','m','y','k','b--','g--','r--','c--','m--','y--','k--','b-.','g-.','r-.','c-.','m-.','y-.','k-.'}; 
    size_files = size(ex,2);
    
    figure
    
    for i=1:size_files
        
        %load([pers,ex{1,i},'.mat']);
                
        subplot(3,2,i);        
        %plot(x,file(1:1000,1:2));
        
        plot(x,file{1,i}(1:1000,1:2));
        
        legend('simulation','spirogram');
        xlabel('time (s)');
        ylabel('V_{lungs} (L)');
        title([pers,ex{1,i}],'Interpreter','none');
       
    end
%v2
ex={'Standing, Quiet)','Standing, Forced)','Sitting, Quiet)','Sitting, Forced)','Lying, Quiet)','Lying, Forced)'};
  
 
    figure
    
    for i=1:6
        
        %load([pers,ex{1,i},'.mat']);
                
        subplot(3,2,i);        
        %plot(x,file(1:1000,1:2));
        
        plot(th{1,i}(1:1000,1));
hold on
plot(th{1,i}(1:1000,2),'r--');
        
        legend('simulation','spirogram');
        xlabel('sample');
        ylabel('V_{lungs} (L)');
        title(['(Patient 1, ',ex{1,i}],'Interpreter','none');
       
    end
    
%%%%%%%%%%%%%%%%%%%%
pers = 'th';
    ex={'_stan_q','_stan_f','_sit_q','_sit_f','_l_q','_l_f'};
    color = {'b','g','r','c','m','y','k','b--','g--','r--','c--','m--','y--','k--','b-.','g-.','r-.','c-.','m-.','y-.','k-.'}; 
    size_files = size(ex,2);
    
    figure
    
    for i=1:size_files
        
        %load([pers,ex{1,i},'.mat']);
                
        subplot(3,2,i);        
        %plot(x,file(1:1000,1:2));
        l_vec = size(th_prep{1,i},1);
        x=(1:1:l_vec)/40;

        plot(x,th_prep{1,i}(1:l_vec,1:3));
        
        legend('simulation prep','spirogram prep','slp prep');
        xlabel('time (s)');
        ylabel('V_{lungs} (L)');
        title([pers,ex{1,i}],'Interpreter','none');
       
    end
    
    

%trendplot
x2=(1:1:size(file(:,1),1))';
[poly6_fit]=trendplot(x2,file(:,1));
new_c=(poly6_fit+file(:,1))/2;
figure
plot(x2,file(:,1),x2,poly6_fit,x2,new_c,x2,file(:,2));
legend('raw','fit','combo','spiro')

figure
plot(x2,new_c,x2,file(:,2));
legend('combo','spiro')


%r2
pers = 'to';
ex={'_stan_q','_stan_f','_sit_q','_sit_f','_l_q','_l_f'};
for i=1:1:6
    [pers,ex{1,i}]
    l_end = min(size(to_prep{1,i}(:,1),1),size(to_prep{1,i}(:,3),1));
    rsquare(to_prep{1,i}(1:l_end,1),to_prep{1,i}(1:l_end,3))
end


%csvwrite
pers = 'to';
ex={'_stan_q','_stan_f','_sit_q','_sit_f','_l_q','_l_f'};
for i=1:1:6
    csvwrite([pers,ex{i},'_simu_spir_slp.csv'],to{1,i}(1:1000,1:3));
end


%read sss_prep
pers = 'j';
ex={'_stan_q','_stan_f','_sit_q','_sit_f','_l_q','_l_f'};

for i=1:1:6
    file=[pers,ex{i},'_simu_spir_slp_sss_prep.csv'];
    donnees = importdata(file);
    j_prep{1,i} = donnees.data;
end