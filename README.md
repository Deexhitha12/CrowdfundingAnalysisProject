# CrowdfundingAnalysisProject # The project is about the crowdfunding platform named kickstarter (https://www.kickstarter.com/) 
This project focuses on analyzing and visualizing crowdfunding performance metrics using Excel, Power BI, Tableau, and SQL. The goal is to provide actionable insights into project success rates, backer behavior, and financial trends, enabling improved decision-making for stakeholders.

# Data set and modelling 
I have used 4 excel sheets(Creator,Project,Location,Category) as a data source. Here, Project sheet is a primary sheet which consist of all the necessary data. I have established relationship from Project sheet to all other sheets based on the common columns Creator_id,Location_id and Category_id). 

# Data Cleaning and transformation:

1. Converted the Date fields to Natural Time ( Currently the dates are in Epoch time https://www.epochconverter.com/ ) 

-> I have to calculate natural time using power query editor for the date columns using the formula (columnname/86400) + 25569) //for Columns H to M

2. Built a Calendar Table using the Date Column Created Date ( Which has Dates from Minimum Dates and Maximum Dates)
  Added all the below Columns in the Calendar Table using the Formulas.
   A.Year
   B.Monthno
   C.Monthfullname
   D.Quarter(Q1,Q2,Q3,Q4)
   E. YearMonth ( YYYY-MMM)
   F. Weekdayno
   G.Weekdayname
   H.FinancialMOnth ( April = FM1, May= FM2  …. March = FM12)
   I. Financial Quarter ( Quarters based on Financial Month FQ-1 . FQ-2..)

-> used the column name **created_date** from the **projects** sheet

3. Built the Data Model using the attached Excel Files. Established relationship between every sheet.

4. Converted the Goal amount into USD using the Static USD Rate. Formula used : **Goal amount** x **static USD rate**

# KPI metrics tracked
1. Projects Overview KPI :
     Total Number of Projects based on outcome - Total number of projects based on state Column(projects sheet)- failed, successful, cancelled
     Total Number of Projects based on Locations -using **projects(Id**) and **locations** sheet (displayable name column)
     Total Number of Projects based on  Category- using **projects(id)** and **category** sheet(name column)
     Total Number of Projects created by Year , Quarter , Month Crowdfunding_projects and date column or calender table)` 
2.  Successful Projects -
     Amount Raised - Total amount raised, Filtered Succesful Projects
     Number of Backers - Total number of backers for Succesful Projects
     Avg Number of Days for successful projects - Took difference of Deadline and Creation_date columns and added new column, then took average of the new column

3 . Top Successful Projects :
    Based on Number of Backers
    Based on Amount Raised.

4. Percentage of Successful Projects overall 
   Percentage of Successful Projects  by Category 
   Percentage of Successful Projects by Year , Month etc..
   Percentage of Successful projects by Goal Range


