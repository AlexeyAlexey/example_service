Sequel.migration do
  up do
    run <<~SQL
      CREATE TABLE public.test_table_user (
        id UUID,
        user_id UUID,
        email text,
        created_at timestamp,
        updated_at_at timestamp
      );
    SQL
  end

  down do
    run <<~SQL
      DROP TABLE IF EXISTS public.test_table_user cascade;
    SQL
  end
end
