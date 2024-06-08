# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create some lawyers
lawyer1 = Lawyer.create(name: "Sohal Singh", specialization: "Corporate Law", contact_details: "sohal@example.com")
lawyer2 = Lawyer.create(name: "Rishabh Singh", specialization: "Contract Law", contact_details: "rishabh@example.com")

# Create some risks
risk1 = Risk.create(description: "High financial risk", level: "High")
risk2 = Risk.create(description: "Low compliance risk", level: "Low")

# Create suggestions
Suggestion.create(risk: risk1, lawyer: lawyer1)
Suggestion.create(risk: risk2, lawyer: lawyer2)
