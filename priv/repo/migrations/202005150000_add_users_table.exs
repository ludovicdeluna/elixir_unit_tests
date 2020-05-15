defmodule MyRepo.Migrations.AddUsersTable do
  use Ecto.Migration

  def up do
    create table("users") do
      add :regnum,  :integer
      add :name,    :string, size: 40
      add :city,    :string, size: 40

      timestamps()
    end
  end

  def down do
    drop table("users")
  end
end
