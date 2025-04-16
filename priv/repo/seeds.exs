# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     KatiPortfolio.Repo.insert!(%KatiPortfolio.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias KatiPortfolio.Portfolio.Project
alias KatiPortfolio.Repo

# Clear existing projects
Repo.delete_all(Project)

# Create sample projects
projects = [
  %{
    title: "EngageWIT",
    description: "A digital platform for workplace innovation training, focusing on user experience and accessibility.",
    image_path: "/images/placeholder.jpg",
    year: "2023"
  },
  %{
    title: "Family Nurturing Center",
    description: "Redesign of a non-profit organization's website to improve information architecture and user engagement.",
    image_path: "/images/placeholder.jpg",
    year: "2023/2024"
  },
  %{
    title: "Patient Reach 360",
    description: "A healthcare communication platform designed to improve patient-provider interaction.",
    image_path: "/images/placeholder.jpg",
    year: "2020"
  }
]

# Insert projects
Enum.each(projects, fn project_data ->
  Repo.insert!(%Project{
    title: project_data.title,
    description: project_data.description,
    image_path: project_data.image_path,
    year: project_data.year
  })
end)

IO.puts("Database seeded successfully!")
