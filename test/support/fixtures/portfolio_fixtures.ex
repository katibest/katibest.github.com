defmodule KatiPortfolio.PortfolioFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KatiPortfolio.Portfolio` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image_path: "some image_path",
        title: "some title",
        year: "some year"
      })
      |> KatiPortfolio.Portfolio.create_project()

    project
  end
end
