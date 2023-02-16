function Patient=PatientTable(randomizer,&NumberPatient,PatientType)
    arrival=0; 
    Patient = struct('RdService',cell(1,NumberPatient),'Service',cell(1,NumberPatient),'RdInterval',cell(1,NumberPatient),'Interval',cell(1,NumberPatient),'ArrivalTime',cell(1,NumberPatient),'RdCaseType',cell(1,NumberPatient),'CaseType',cell(1,NumberPatient),'RdType',cell(1,NumberPatient),'Type',cell(1,NumberPatient));
    
    for(i=1:NumberPatient);             
        
        Random=feval(randomizer,5,0,100);  
        Patient(1,i).RdService=Random(1);
        Patient(1,i).Service=rdservice(Patient(1,i).RdService);
        Patient(1,i).RdInterval=Random(2);
        Patient(1,i).Interval=rdinterarr(Patient(1,i).RdInterval);
        Patient(1,i).ArrivalTime=arrival;  
        arrival=arrival+Patient(1,i).Interval; 
        
        Random=feval(randomizer,5,0,100);
        
        Patient(1,i).RdCaseType=Random(1);
        Patient(1,i).CaseType=rdcasetype(Patient(1,i).RdCaseType);
        Patient(1,i).RdType=Random(2);
        Patient(1,i).Type=rdtype(PatientType(i));
        
    end;
            
                
            