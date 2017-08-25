th_t_simu=[th{1,1}(1:1000,1);th{1,2}(1:1000,1);th{1,3}(1:1000,1);th{1,4}(1:1000,1);th{1,5}(1:1000,1);th{1,6}(1:1000,1)];
th_t_spir=[th{1,1}(1:1000,2);th{1,2}(1:1000,2);th{1,3}(1:1000,2);th{1,4}(1:1000,2);th{1,5}(1:1000,2);th{1,6}(1:1000,2)];
bland_altman(th_t_simu,th_t_spir)

j_t_simu=[j{1,1}(1:1000,1);j{1,2}(1:1000,1);j{1,3}(1:1000,1);j{1,4}(1:1000,1);j{1,5}(1:1000,1);j{1,6}(1:1000,1)];
j_t_spir=[j{1,1}(1:1000,2);j{1,2}(1:1000,2);j{1,3}(1:1000,2);j{1,4}(1:1000,2);j{1,5}(1:1000,2);j{1,6}(1:1000,2)];
bland_altman(j_t_simu,j_t_spir)

to_t_simu=[to{1,1}(1:1000,1);to{1,2}(1:1000,1);to{1,3}(1:1000,1);to{1,4}(1:1000,1);to{1,5}(1:1000,1);to{1,6}(1:1000,1)];
to_t_spir=[to{1,1}(1:1000,2);to{1,2}(1:1000,2);to{1,3}(1:1000,2);to{1,4}(1:1000,2);to{1,5}(1:1000,2);to{1,6}(1:1000,2)];
bland_altman(to_t_simu,to_t_spir)



ex={'Standing, Quiet)','Standing, Forced)','Sitting, Quiet)','Sitting, Forced)','Lying, Quiet)','Lying, Forced)'};
   
    figure
    
    for i=1:6
        
        %load([pers,ex{1,i},'.mat']);
                
        subplot(3,2,i);        
        %plot(x,file(1:1000,1:2));
 
        
bland_altman(th{1,i}(1:1000,1),th{1,i}(1:1000,2));
        
        %legend('simulation','spirogram');
        %xlabel('sample');
        %ylabel('V_{lungs} (L)');
        title(['(Patient 1, ',ex{1,i}],'Interpreter','none');
       
    end