function Counter = CounterTable(&Patient, NumberPatient, NumberCounter, NumberPriorityCounter, PatientType)

Counter=struct('NoPatient',cell(NumberCounter + NumberPriorityCounter,NumberPatient),'Service', cell(NumberCounter+NumberPriorityCounter,NumberPatient),'TimeServiceBegin', cell(NumberCounter+NumberPriorityCounter,NumberPatient),'TimeServiceEnd', cell(NumberCounter+NumberPriorityCounter,NumberPatient),'WaitingTime', cell(NumberCounter+NumberPriorityCounter,NumberPatient),'TimeSpend', cell(NumberCounter+NumberPriorityCounter,NumberPatient));
for (i=1:NumberCounter + NumberPriorityCounter)
    Counter (i,1).TimeServiceBegin=0;
end

a=ones(1,NumberCounter+NumberPriorityCounter);
lastservice=0;
for (i=1:NumberPatient)
    
    if (PatientType (1)==1) 
        smallest=1;
        if (NumberCounter>1)
            for (j=1: (NumberCounter-1))
                if (Counter (j+1, a(j+1)).TimeServiceBegin < Counter(smallest, a(smallest)).TimeServiceBegin) 
                    smallest=j+1;
                end;
            end;
        end;
    end;

    if (PatientType(i)==2)
        smallest=NumberCounter+1;
        if (NumberPriorityCounter>1)
            for(j=NumberCounter+1: NumberCounter+NumberPriorityCounter-1)
                if (Counter (j+1,a (j+1)).TimeServiceBegin < Counter(smallest,a(smallest)).TimeServiceBegin)
                    smallest=j+1;
                end;
            end;
        end;
    end;
    
    Counter(smallest,a(smallest)).NoPatient=i; 
    Counter(smallest,a(smallest)).Service=Patient(i).Service;
    if (Counter(smallest,a(smallest)).TimeServiceBegin < Patient (i).ArrivalTime) 
        Counter (smallest, a (smallest)).WaitingTime=0;
        Counter (smallest, a (smallest)).TimeServiceBegin=Patient(i).ArrivalTime;
    else
        Counter (smallest,a(smallest)).WaitingTime=Counter(smallest,a(smallest)).TimeServiceBegin-Patient(i).ArrivalTime;
    end;
    Counter (smallest,a(smallest)).TimeServiceEnd = Counter(smallest, a(smallest)).TimeServiceBegin + Counter(smallest,a(smallest)).Service; 
    Counter (smallest,a(smallest)).TimeSpend = Counter (smallest,a(smallest)).Service + Counter (smallest, a (smallest)).WaitingTime;
    a(smallest)=a(smallest)+1;
    Counter (smallest, a(smallest)).TimeServiceBegin=Counter(smallest,(a(smallest)-1)).TimeServiceEnd;
    if(Counter(smallest,(a(smallest)-1)).TimeServiceEnd > lastservice) 
        lastservice=Counter (smallest, (a(smallest)-1)).TimeServiceEnd;
    end;
end;
printf('\n-----------------------Queue Simulation--------------------------------\n\n');
for (i=NumberCounter+1:NumberCounter+NumberPriorityCounter)
    printf('Counter %1d, ',i);
    if(i==NumberCounter+NumberPriorityCounter)
        printf(' are only for Priority patients.\n')
    end;
end;
a=ones(1,NumberCounter+NumberPriorityCounter);
b=ones(1,NumberCounter+NumberPriorityCounter);
arrivalPatient=1;
time=0;
for (i=0:lastservice)
    if (arrivalPatient<=NumberPatient)
        if (Patient(1,arrivalPatient).ArrivalTime==i)
            printf('Minute %02d: Arrival of ', Patient(1,arrivalPatient). ArrivalTime);
            if (arrivalPatient==1)
                printf('first ' );
            elseif(arrivalPatient==2)
                printf('second ');
            elseif(arrivalPatient==3)
                printf( 'third ');
            else
                printf('%2dth ',arrivalPatient);
            end;
            if(PatientType (arrivalPatient)==1) 
                printf('normal ');
            else
                printf('priority ');
            end;
            printf('patient. \n\n'); 
            arrivalPatient=arrivalPatient+1;
        end;
    end;
    for(j=1:NumberCounter+NumberPriorityCounter) 
            if (Counter(j,b(j)).TimeServiceEnd==i)
            printf('Minute %02d: Departure of ', Counter(j,b(j)).TimeServiceEnd);
            if (Counter(j,b(j)).NoPatient==1) 
                printf('first ');
            elseif(Counter(j,b(j)).NoPatient==2) 
                printf('second ');
            elseif(Counter(j,b(j)).NoPatient==3) 
                printf('third ');
            else
                printf('%2dth ', Counter(j,b(j)).NoPatient);
            end;
            if(PatientType(Counter (j,b(j)).NoPatient)==1) 
                printf('normal ');
            else    
                printf('priority ');
            end;
            printf('patient where the Counter Number is %1d.\n\n',j);
            b(j)=b(j)+1;
        end;
            if (isempty(Counter (j,a(j)).NoPatient)) 
            continue;
        end;
            if (Counter(j,a(j)).TimeServiceBegin==i)
                if (a(j)==1 & ~i==0 & ~j==NumberCounter+1) 
                    printf('Minute %02d: Counter %1d start operation \n', Counter (j,a(j)).TimeServiceBegin,j);
                end; 
                printf('Minute %02d: Service for ',Counter(j,a(j)).TimeServiceBegin);
                if (Counter(j,a(j)).NoPatient==1)
                    printf('first ');
                elseif (Counter (j,a(j)).NoPatient==2)
                    printf('second ');
                elseif (Counter (j,a(j)).NoPatient==3) 
                    printf('third ');
                else
                    printf('%2dth ',Counter(j,a(j)).NoPatient); 
                end;
                    if (PatientType(Counter (j,b(j)).NoPatient)==1) 
                    printf('normal ');
                else    
                    printf('priority ');
                end;
                printf('patient started where Counter Number is %1d.\n\n',j );
                    a(j)=a(j)+1;
            end;
    end;
    if(i==lastservice)
        for (j=1:NumberCounter+NumberPriorityCounter)
            printf('Minute %02d: Counter %1d closed.\n',i,j);
        end;
    end;
end;
printf('\n-----------------------------------------------------------------------------------------------\n\n');