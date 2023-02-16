while true
    sprintf('Please Choose a Random Number Generator Below\n1 = LCG\n2 = RUN')
    r=input('Enter= ');
    if(r== 1)
        randomizer='LCG'
        break
    elseif(r== 2)
        randomizer='RUN'
        break
    else
        sprintf('Please choose either 1 or 2')
    end
end


NumberCounter=2;
NumberPriorityCounter=1;
ServiceTable=[0.2f,0.15f,0.3f,0.2f,0.1f;0.2f,0.35f,0.65f,0.85f,1f;0,21,36,66,86;20,35,65,85,100];
InterarrTable=[0.4f,0.2f,0.2f,0.1f,0.1f;0.3f,0.6f,0.8f,0.9f,1f;0,41,61,81,91;40,60,80,90,100];
CaseType=[0.5f,0.5f;0.5f,1f;0,61;60,100];
CaseName=['Non-Priority Case';'    Priority Case'];

InputPrint(ServiceTable,InterarrTable,CaseName,CaseType);

sprintf('Please enter the number of patients')
    NumberPatient=input('Enter = ');
%NumberCustomer=round(rand*100)+150;
    
%customer = struct('RdDay',cell(1,NumberCustomer));    
for(i=1:NumberPatient)
    PatientTypeRand=rand*100;
    %CustTypeRand=customer(1,i).RdType;
    if(PatientTypeRand<90)
        PatientType(i)=1;     
    else
        PatientType(i)=2;
    end
end


Patient=PatientTable(randomizer,NumberPatient,PatientType);

Counter=CounterTable(Patient,NumberPatient,NumberCounter,NumberPriorityCounter,PatientType);
printf('\nNumber of patients = %d',NumberPatient);


print(Patient,NumberPatient,Counter,NumberCounter,NumberPriorityCounter);


