defmodule KatiPortfolio.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :description, :text
      add :image_path, :string
      add :year, :string

      timestamps(type: :utc_datetime)
    end
  end
end
