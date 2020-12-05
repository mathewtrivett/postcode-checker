# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creates the `Southwark` and `Lambeth` ServiceAreas.
# Adds two example postcodes for each respective service area.

[
  {
    name: 'Southwark'
  },
  {
    name: 'Lambeth'
  }
].each do |area|
  ServiceArea.find_or_create_by! area
end

ServiceArea.find_by(name: 'Southwark').allowed_post_codes << AllowedPostCode.find_or_create_by!(postcode: 'SE1 7QD')
ServiceArea.find_by(name: 'Lambeth').allowed_post_codes << AllowedPostCode.find_or_create_by!(postcode: 'SE1 7QA')

# Create AllowedPostCodes that fall outside of the ServiceArea
[
  {
    postcode: 'SH24 1AA'
  },
  {
    postcode: 'SH24 1AB'
  }
].each do |postcode|
  AllowedPostCode.find_or_create_by! postcode
end
