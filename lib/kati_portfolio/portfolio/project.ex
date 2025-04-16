defmodule KatiPortfolio.Portfolio.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :description, :string
    field :image_path, :string
    field :title, :string
    field :year, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title, :description, :image_path, :year])
    |> validate_required([:title, :description, :image_path, :year])
  end
end
