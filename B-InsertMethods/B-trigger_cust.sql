-- Table: public.customer

-- DROP TABLE IF EXISTS public.customer;

CREATE TABLE IF NOT EXISTS public.customer
(
    customerid integer NOT NULL DEFAULT nextval('customer_customerid_seq'::regclass),
    customername character varying(50) COLLATE pg_catalog."default" NOT NULL,
    customersurname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    mail character varying(70) COLLATE pg_catalog."default" NOT NULL,
    city character varying(50) COLLATE pg_catalog."default",
    registrationdate date DEFAULT CURRENT_DATE,
    CONSTRAINT pk_customers PRIMARY KEY (customerid),
    CONSTRAINT customer_mail_key UNIQUE (mail)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customer
    OWNER to postgres;

-- Trigger: trg_set_default_registration_date

-- DROP TRIGGER IF EXISTS trg_set_default_registration_date ON public.customer;

CREATE OR REPLACE TRIGGER trg_set_default_registration_date
    BEFORE INSERT
    ON public.customer
    FOR EACH ROW
    EXECUTE FUNCTION public.set_default_registration_date();