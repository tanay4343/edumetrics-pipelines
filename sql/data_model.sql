CREATE TABLE dim_school (
    school_id   VARCHAR(10)  NOT NULL,
    school_name VARCHAR(100) NOT NULL,
    region      VARCHAR(50)  NOT NULL,
    CONSTRAINT pk_dim_school PRIMARY KEY (school_id)
);

CREATE TABLE dim_teacher (
    teacher_id   VARCHAR(10)  NOT NULL,
    teacher_name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dim_teacher PRIMARY KEY (teacher_id)
);

CREATE TABLE dim_subject (
    subject_id   SERIAL       NOT NULL,
    subject_name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dim_subject PRIMARY KEY (subject_id)
);

CREATE TABLE dim_grade (
    grade_id    SERIAL      NOT NULL,
    grade_level VARCHAR(20) NOT NULL,
    CONSTRAINT pk_dim_grade PRIMARY KEY (grade_id)
);

CREATE TABLE dim_date (
    date_id    SERIAL  NOT NULL,
    exam_date  DATE    NOT NULL,
    year       INTEGER NOT NULL,
    month      INTEGER NOT NULL,
    quarter    INTEGER NOT NULL,
    CONSTRAINT pk_dim_date PRIMARY KEY (date_id)
);

CREATE TABLE fact_exam_results (
    result_id   SERIAL         NOT NULL,

    -- Foreign Keys to Dimension Tables
    school_id   VARCHAR(10)    NOT NULL,
    teacher_id  VARCHAR(10)    NOT NULL,
    subject_id  INTEGER        NOT NULL,
    grade_id    INTEGER        NOT NULL,
    date_id     INTEGER        NOT NULL,

    -- Measures
    num_students INTEGER        NOT NULL,
    avg_score    NUMERIC(5, 2)  NOT NULL,
    pass_rate    NUMERIC(5, 4)  NOT NULL,   

    CONSTRAINT pk_fact_exam_results PRIMARY KEY (result_id),
    CONSTRAINT fk_school  FOREIGN KEY (school_id)  REFERENCES dim_school  (school_id),
    CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES dim_teacher (teacher_id),
    CONSTRAINT fk_subject FOREIGN KEY (subject_id) REFERENCES dim_subject (subject_id),
    CONSTRAINT fk_grade   FOREIGN KEY (grade_id)   REFERENCES dim_grade   (grade_id),
    CONSTRAINT fk_date    FOREIGN KEY (date_id)    REFERENCES dim_date    (date_id)
);