defmodule KatiPortfolio.PortfolioTest do
  use KatiPortfolio.DataCase

  alias KatiPortfolio.Portfolio

  describe "projects" do
    alias KatiPortfolio.Portfolio.Project

    import KatiPortfolio.PortfolioFixtures

    @invalid_attrs %{description: nil, image_path: nil, title: nil, year: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Portfolio.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Portfolio.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", image_path: "some image_path", title: "some title", year: "some year"}

      assert {:ok, %Project{} = project} = Portfolio.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.image_path == "some image_path"
      assert project.title == "some title"
      assert project.year == "some year"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Portfolio.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", image_path: "some updated image_path", title: "some updated title", year: "some updated year"}

      assert {:ok, %Project{} = project} = Portfolio.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.image_path == "some updated image_path"
      assert project.title == "some updated title"
      assert project.year == "some updated year"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Portfolio.update_project(project, @invalid_attrs)
      assert project == Portfolio.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Portfolio.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Portfolio.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Portfolio.change_project(project)
    end
  end
end
