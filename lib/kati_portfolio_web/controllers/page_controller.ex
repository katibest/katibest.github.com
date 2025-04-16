defmodule KatiPortfolioWeb.PageController do
  use KatiPortfolioWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: {KatiPortfolioWeb.Layouts, :landing})
  end

  def engagewit(conn, _params) do
    render(conn, "engagewit.html", layout: {KatiPortfolioWeb.Layouts, :landing})
  end

  def family_nurturing_center(conn, _params) do
    render(conn, "family_nurturing_center.html", layout: {KatiPortfolioWeb.Layouts, :landing})
  end

  def patient_reach_360(conn, _params) do
    render(conn, "patient_reach_360.html", layout: {KatiPortfolioWeb.Layouts, :landing})
  end

  def other_project(conn, _params) do
    render(conn, "other_project.html", layout: {KatiPortfolioWeb.Layouts, :landing})
  end
end
