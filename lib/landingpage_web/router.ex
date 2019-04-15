defmodule LandingpageWeb.Router do
  use LandingpageWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LandingpageWeb do
    pipe_through :browser

    get "/", LeadController, :new
    get "/:id/thank-you", LeadController, :show
    resources "/leads", LeadController , except: [:new, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", LandingpageWeb do
  #   pipe_through :api
  # end
end
