defmodule KatiPortfolioWeb.ProjectController do
  use KatiPortfolioWeb, :controller

  alias KatiPortfolio.Portfolio
  alias KatiPortfolio.Portfolio.Project

  def index(conn, _params) do
    projects = Portfolio.list_projects()
    render(conn, :index, projects: projects)
  end

  def new(conn, _params) do
    changeset = Portfolio.change_project(%Project{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"project" => project_params}) do
    case Portfolio.create_project(project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: ~p"/projects/#{project}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Portfolio.get_project!(id)
    render(conn, :show, project: project)
  end

  def edit(conn, %{"id" => id}) do
    project = Portfolio.get_project!(id)
    changeset = Portfolio.change_project(project)
    render(conn, :edit, project: project, changeset: changeset)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Portfolio.get_project!(id)

    case Portfolio.update_project(project, project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project updated successfully.")
        |> redirect(to: ~p"/projects/#{project}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, project: project, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Portfolio.get_project!(id)
    {:ok, _project} = Portfolio.delete_project(project)

    conn
    |> put_flash(:info, "Project deleted successfully.")
    |> redirect(to: ~p"/projects")
  end
end
