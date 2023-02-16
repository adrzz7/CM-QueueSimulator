function print(&Patient,PatientNumber,&Counter,NumberCounter,NumberPriorityCounter)
    TotalInterArr=0;
    TotalArr=0;
    TotalWaitPatient=0;
    TotalWaitTime=zeros(1,NumberCounter+NumberPriorityCounter);
    TotalService=zeros(1,NumberCounter+NumberPriorityCounter);
    TotalSales=zeros(1,NumberCounter+NumberPriorityCounter);
    TotalTimeSpent=zeros(1,NumberCounter+NumberPriorityCounter);
    PatientNumCounter=zeros(NumberCounter+NumberPriorityCounter);
    %customer table
    printf('\n---------------------------------------------------------------------------------------------\n');
    printf('N |      RN for       | Interarrival | Arrival |   Age   |   RN for the   |  Case  |\n');
    printf('  | Interarrival Time |     Time     |  Time   |         |    Case Type   |  Type  |\n');
    printf('---------------------------------------------------------------------------------------------\n');
    for(i=1:PatientNumber);
        printf('%3d|%19d|%14d|%9d|%12d|%12d|%10s|\n',i,Patient(1,i).RdInterval,Patient(1,i).Interval,Patient(1,i).ArrivalTime,Patient(1,i).RdType,Patient(1,i).RdCaseType,Patient(1,i).Type);
        TotalInterArr=TotalInterArr+Patient(1,i).Interval;
        TotalArr=TotalArr+Patient(1,i).ArrivalTime;
    end;
    printf('\n-------------------------------------------------------------------------------------------------------\n\n\n');
    %counter tables
    for(i=1:NumberCounter+NumberPriorityCounter)
        printf('\nCounter %2d',i);
        if (i>NumberCounter)
            printf(' (Priority):\n');
        else
            printf(':\n');
        end;
        printf('\n----------------------------------------------------------------------------------------\n');
        printf('N |    RN for    | Service | Time Service |  Time Service |  Waiting  |    Time Spent    |\n');
        printf('  | Service Time |  Time   |    Begin     |      End      |   Time    |  in the System   |\n');
        printf('\n----------------------------------------------------------------------------------------\n');
        for(j=1:PatientNumber);
            if(isempty(Counter(i,j).NoPatient));
                break;
            end;
            printf('%3d|%14d|%11d|%14d|%14d|%12d|%20d|\n',Counter(i,j).NoPatient,Patient(Counter(i,j).NoPatient).RdService,Counter(i,j).Service,Counter(i,j).TimeServiceBegin,Counter(i,j).TimeServiceEnd,Counter(i,j).WaitingTime,Counter(i,j).TimeSpend);
            %TotalWaitTime(i)=TotalWaitTime(i)+Counter(i,j).WaitingTime;
            if(Counter(i,j).WaitingTime>0)
                TotalWaitPatient=TotalWaitPatient+1;
            end
            TotalWaitTime(i)=TotalWaitTime(i)+Counter(i,j).WaitingTime;
            TotalService(i)=TotalService(i)+Counter(i,j).Service;
            PatientNumCounter(i)=PatientNumCounter(i)+1;
            TotalTimeSpent(i)=TotalTimeSpent(i)+Counter(i,j).TimeSpend;
        end;
        printf('\n-----------------------------------------------------------------------------------------\n\n\n');
    end;  

    for (i=1: NumberCounter+NumberPriorityCounter)
        printf('Average Waiting Time for Counter %d = %f\n',i,TotalWaitTime(i)/PatientNumCounter(i));
    end    
    printf('\nAverage Inter-arrival Time= %f\n',TotalInterArr/(PatientNumber-1));
    printf('\nAverage Arrival Time = %f\n\n',TotalArr/ (PatientNumber-1));
    for (i=1: NumberCounter+NumberPriorityCounter)
        printf('Average Time Spent for Counter %d = %f\n',i,TotalTimeSpent(i)/PatientNumCounter(i));
    end
    printf('\nProbability that a patient has to wait in the queue= %f\n\n', TotalWaitPatient/PatientNumber);
    for (i=1: NumberCounter+NumberPriorityCounter)
        printf('Average Service Time for Counter %d = %f\n',i,TotalService(i)/PatientNumCounter(i));
    end
    
    
    
    
    
    
    
    