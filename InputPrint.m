function InputPrint(&ServiceTable,&InterarrTable,&CaseName,&CaseType)
        
    printf('-------------------------------------------\n');
    printf('Service Time | Probability | CDF | Range  |\n');
    printf('-------------------------------------------\n');
    for(i=3:7);
        printf('%13d|%13.2f|%5.2f|%3d -%4d|\n',i,ServiceTable(1,i-2),ServiceTable(2,i-2),ServiceTable(3,i-2),ServiceTable(4,i-2));
    end;
    printf('-------------------------------------------\n\n');
    
    printf('-------------------------------------------------\n');
    printf('Inter-arrival Time | Probability | CDF | Range  |\n');
    printf('-------------------------------------------------\n');
    for(i=1:5);
        printf('%18d|%13.2f|%5.2f|%3d -%4d|\n',i,InterarrTable(1,i),InterarrTable(2,i),InterarrTable(3,i),InterarrTable(4,i));
    end;
    printf('-------------------------------------------------\n\n');
    
    printf('-----------------------------------------------\n');
    printf('Case Type          | Probability | CDF | Range |\n');
    printf('-----------------------------------------------\n');
    for(i=1:2);
        printf('%17s|%13.2f|%5.2f|%4d -%4d|\n',CaseName(i,1:17),CaseType(1,i),CaseType(2,i),CaseType(3,i),CaseType(4,i));
    end;
    printf('-------------------------------------------------\n\n');