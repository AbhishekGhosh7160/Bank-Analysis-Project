use bankloan;

-- kpi 1 (Year wise loan amount Stats)

select year, concat("$", format(round(sum(loan_amnt)/1000000,2),2),"M")as loan_amnt 
from finance_1
group by YEAR
order by year;

-- kpi 2 (Grade and sub grade wise revol_bal)

select grade,sub_grade,concat("$", format(round(sum(revol_bal)/1000,2),2),"K")as revol_bal 
from finance_1
inner join
finance_2
on finance_1.id=finance_2.id
group by grade,sub_grade
order by grade,sub_grade;

-- kpi 3 (Total Payment for Verified Status Vs Total Payment for Non Verified Status)

select verification_status, concat("$", format(round(sum(total_pymnt)/1000000,2),2),"M")as total_pymnt
from finance_1
inner join
finance_2
on finance_1.id=finance_2.id
group by verification_status
order by verification_status desc;

-- kpi 4 (State wise and month wise loan status)

select addr_state, month,loan_status
from finance_1
group by addr_state, month,loan_status
order by addr_state, month,loan_status;

-- kpi 5 (Home ownership Vs last payment date stats)

select home_ownership,last_pymnt_d
from finance_1
inner join
finance_2
on finance_1.id=finance_2.id
group by home_ownership,last_pymnt_d
order by home_ownership;

-- thank you --
