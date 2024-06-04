-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- SQL_Challenge
CREATE TABLE "departments" (
    "dept_no" INT   NOT NULL,
    "dept_name" VARCHAR   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" INT   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" INT   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" INT   NOT NULL,
    "birth_date" INT   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" INT   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" INT   NOT NULL,
    "title" VARCHAR   NOT NULL
);



