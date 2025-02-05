drop database if exists predicted_outputs;
create database if not exists predicted_outputs;
use predicted_outputs;

drop table if exists predicted_outputs;
create table predicted_outputs
(
	Reason_1 BIT NOT NULL,
    Reason_2 BIT NOT NULL,
    Reason_3 BIT NOT NULL,
    Reason_4 BIT NOT NULL,
    Month_value INT NOT NULL,
    Transportation_Expense INT NOT NULL,
    Age INT NOT NULL,
    Body_Mass_Index INT NOT NULL,
    Education BIT NOT NULL,
    Children INT NOT NULL,
    Pets INT NOT NULL,
    Probability FLOAT NOT NULL,
    Prediction BIT NOT NULL
);

select * from predicted_outputs;
select Body_Mass_Index,group_concat(AGE) from predicted_outputs group by Body_Mass_Index;