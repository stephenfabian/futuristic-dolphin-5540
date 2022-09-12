require 'rails_helper'

 RSpec.describe 'Story 1 - Mechanic Index Page' do
  describe 'When I visit the mechanics index page' do
    describe 'I see a header saying “All Mechanics”' do
      describe 'And I see a list of all mechanic’s names and their years of experience' do
        it 'And I see the average years of experience across all mechanics' do

          @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
          @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

          @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
          @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
          @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

          @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

          mechanic1 = Mechanic.create!(name: "Steve", years_of_experience: 60)
          mechanic2 = Mechanic.create!(name: "Roger", years_of_experience: 64)

          mechanic_rides1 = MechanicRide.create!(ride_id: @jaws.id, mechanic_id: mechanic1.id)
          mechanic_rides2 = MechanicRide.create!(ride_id: @scrambler.id, mechanic_id: mechanic1.id)

          visit "/mechanics"
          expect(page).to have_content("All Mechanics")
          expect(page).to have_content("Roger")
          expect(page).to have_content("Steve")
          expect(page).to have_content(60)
          expect(page).to have_content(64)
          expect(page).to have_content("Average Years of Experience Across All Mechanics")
          save_and_open_page
          expect(page).to have_content(62)

        end
      end
    end
  end
 end