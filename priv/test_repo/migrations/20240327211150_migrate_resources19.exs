defmodule AshPostgres.TestRepo.Migrations.MigrateResources19 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:users) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:temp_entities, prefix: "temp") do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:records) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:profile, prefix: "profiles") do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:posts) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    drop(constraint(:post_ratings, "post_ratings_resource_id_fkey"))

    alter table(:post_ratings) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))

      modify(
        :resource_id,
        references(:posts, column: :id, name: "post_ratings_resource_id_fkey", type: :uuid)
      )
    end

    alter table(:post_followers) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:orgs) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:multitenant_orgs) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:managers) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:entities) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:complex_calculations_skills) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:complex_calculations_documentations) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:complex_calculations_channels) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:complex_calculations_certifications_channel_members) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:complex_calculations_certifications) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:comments) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    drop(constraint(:comment_ratings, "comment_ratings_resource_id_fkey"))

    alter table(:comment_ratings) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))

      modify(
        :resource_id,
        references(:comments, column: :id, name: "comment_ratings_resource_id_fkey", type: :uuid)
      )
    end

    alter table(:authors) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    alter table(:accounts) do
      modify(:id, :uuid, default: fragment("gen_random_uuid()"))
    end

    execute(
      "ALTER TABLE comment_ratings alter CONSTRAINT comment_ratings_resource_id_fkey NOT DEFERRABLE"
    )

    execute(
      "ALTER TABLE post_ratings alter CONSTRAINT post_ratings_resource_id_fkey NOT DEFERRABLE"
    )
  end

  def down do
    alter table(:accounts) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:authors) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    drop(constraint(:comment_ratings, "comment_ratings_resource_id_fkey"))

    alter table(:comment_ratings) do
      modify(
        :resource_id,
        references(:comments, column: :id, name: "comment_ratings_resource_id_fkey", type: :uuid)
      )

      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:comments) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:complex_calculations_certifications) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:complex_calculations_certifications_channel_members) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:complex_calculations_channels) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:complex_calculations_documentations) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:complex_calculations_skills) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:entities) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:managers) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:multitenant_orgs) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:orgs) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:post_followers) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    drop(constraint(:post_ratings, "post_ratings_resource_id_fkey"))

    alter table(:post_ratings) do
      modify(
        :resource_id,
        references(:posts, column: :id, name: "post_ratings_resource_id_fkey", type: :uuid)
      )

      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:posts) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:profile, prefix: "profiles") do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:records) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:temp_entities, prefix: "temp") do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end

    alter table(:users) do
      modify(:id, :uuid, default: fragment("uuid_generate_v4()"))
    end
  end
end
