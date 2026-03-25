CREATE TABLE public.icpsr_data_desc(id SERIAL PRIMARY KEY,  
                             name VARCHAR, 
                             abstract VARCHAR,
                             icpsr_terms VARCHAR, 
                             model_selected_terms VARCHAR,
                             model_selected_terms_no_hal VARCHAR,
                             database_selected_terms VARCHAR
                             );

\COPY public.icpsr_data_desc(name, abstract, icpsr_terms, model_selected_terms, model_selected_terms_no_hal)
 FROM  '/home/maahutch/NonLLM/output_ICPSR_500.csv' DELIMITER ',' CSV HEADER QUOTE '"'; 

ALTER TABLE public.icpsr_data_desc
ADD COLUMN search_vector tsvector
GENERATED ALWAYS AS (to_tsvector('english', abstract)) STORED;