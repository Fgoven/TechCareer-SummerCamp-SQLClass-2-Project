-- FUNCTION: public.set_default_registration_date()

-- DROP FUNCTION IF EXISTS public.set_default_registration_date();

CREATE OR REPLACE FUNCTION public.set_default_registration_date()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    IF NEW.RegistrationDate IS NULL THEN
        NEW.RegistrationDate := CURRENT_DATE;
    END IF;
    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.set_default_registration_date()
    OWNER TO postgres;
