select * from Bank_Loan_Data

select count(id) as Total_Applications from Bank_Loan_Data

select count(id) as MTD_Total_Applications from Bank_Loan_Data
where month(issue_date)=12 and year(issue_date)=2024

select count(id) as PMTD_Total_Applications from Bank_Loan_Data
where month(issue_date)=11 and year(issue_date)=2024

select Sum(Loan_Amount) as Total_Funded_Amount from Bank_Loan_Data

select Sum(Loan_Amount) as MTD_Total_Funded_Amount from Bank_Loan_Data
where Month(issue_date)=12

select Sum(Loan_Amount) as PMTD_Total_Funded_Amount from Bank_Loan_Data
where Month(issue_date)=11

select sum(total_Payment) as Total_Received_Amount from Bank_Loan_data

select sum(total_Payment) as Total_Received_Amount from Bank_Loan_data
where month(issue_date)=12

select sum(total_Payment) as PMTD_Total_Received_Amount from Bank_Loan_data
where month(issue_date)=11

Select Round(Avg(int_rate),2)*100 as Average_Interest_Rate from Bank_Loan_Data

Select Round(Avg(int_rate),2)*100 as MTD_Average_Interest_Rate from Bank_Loan_Data
where Month(issue_date)=12

Select Round(Avg(int_rate),2) as PMTD_Average_Interest_Rate from Bank_Loan_Data
where Month(issue_date)=11


select Avg(dti)*100 as Average_DTI from Bank_Loan_Data

select Avg(dti)*100 as MTD_Average_DTI from Bank_Loan_Data
where month(issue_date)=12

select Avg(dti)*100 as PMTD_Average_DTI from Bank_Loan_Data
where month(issue_date)=11

select count(case when loan_status= 'Fully Paid' or loan_status= 'Current' then id end)*100
/
count(id) as Good_Loan_Percentage 
From Bank_Loan_Data

select count(Case when loan_status ='Fully Paid' or loan_status='Current' then id end)
As Good_Loan_Application 
from Bank_Loan_Data

select sum(loan_amount) As Good_Loan_Funded_Amount
From Bank_Loan_Data
Where loan_status= 'Fully Paid' or loan_status='Current'

select sum(total_Payment) As Good_Loan_Total_Received_Amount 
from Bank_Loan_Data
Where loan_Status='Fully Paid' or loan_Status='Current'

select count(Case when loan_Status='Charged off' then id end)*100
/
count(id) As Bad_Loan_Application_Percentage
from Bank_Loan_Data

select count(id) As Bad_Loan_Application from Bank_Loan_Data
where loan_status='Charged off'

select sum(loan_amount) as Bad_Loan_Funded_Amount from Bank_Loan_Data
Where loan_Status='Charged off'

select sum(total_Payment) as Bad_Loan_Toatal_Received_Amount from Bank_Loan_Data
Where loan_Status='Charged off'

select loan_Status,
count(id) As Total_Loan_Application,
sum(total_Payment) As Total_Received_Amount,
sum(loan_amount) As Total_Funded_Amount,
avg(int_rate * 100) As Interest_Rate,
avg(dti*100) As DTI
from Bank_Loan_Data
Group By
loan_Status

select loan_Status,
sum(total_Payment) As MTD_Total_Received_Amount,
sum(loan_amount) As MTD_Total_Funded_Amount
 from Bank_Loan_Data
Where month(issue_date)=12
Group BY
loan_Status


select 
Month(issue_date) As Month_Number,
DateName(Month,issue_date) As Month_Name,
count(id) As Total_Loan_Application,
Sum(loan_amount) As Total_Funded_Amount,
Sum(total_payment) As Total_Received_Amount
from Bank_Loan_Data
Group By Month(issue_date) , DateName(Month,Issue_date)
Order BY Month(issue_date)


select address_state,
count(id) As Total_Loan_Application,
sum(total_Payment) As Total_Received_Amount,
sum(loan_amount) As Total_Funded_Amount
from Bank_Loan_Data
Group By
address_state
Order By sum(loan_amount) Desc

select term,
count(id) As Total_Loan_Application,
sum(total_Payment) As Total_Received_Amount,
sum(loan_amount) As Total_Funded_Amount
from Bank_Loan_Data
Group By
term
Order By term

select emp_length,
count(id) As Total_Loan_Application,
sum(total_Payment) As Total_Received_Amount,
sum(loan_amount) As Total_Funded_Amount
from Bank_Loan_Data
Group By
emp_length
Order By count(id) Desc

select purpose,
count(id) As Total_Loan_Application,
sum(total_Payment) As Total_Received_Amount,
sum(loan_amount) As Total_Funded_Amount
from Bank_Loan_Data
where grade='A' and address_state='Delhi'
Group By purpose
Order By count(id) Desc

select home_Ownership,
count(id) As Total_Loan_Application,
sum(total_Payment) As Total_Received_Amount,
sum(loan_amount) As Total_Funded_Amount
from Bank_Loan_Data
Group By
home_ownership
Order By count(id) Desc