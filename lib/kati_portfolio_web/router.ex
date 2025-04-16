defmodule KatiPortfolioWeb.Router do
  use KatiPortfolioWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {KatiPortfolioWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KatiPortfolioWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/projects/engagewit", PageController, :engagewit
    get "/projects/family-nurturing-center", PageController, :family_nurturing_center
    get "/projects/patient-reach-360", PageController, :patient_reach_360
    get "/projects/other-project", PageController, :other_project
    resources "/projects", ProjectController
  end

  # Other scopes may use custom stacks.
  # scope "/api", KatiPortfolioWeb do
  #   pipe_through :api
  # end
end
