require 'rails_helper'

# 

# As a user,
# When I visit a mechanic show page
# 
# 
# 

RSpec.describe 'Story 2 - Mechanic Show Page' do
  describe 'When I visit a mechanic show page' do
    describe 'I see their name, years of experience, and the names of rides they’re working on' do
      describe 'And I only see rides that are open' do
        it 'And the rides are listed by thrill rating in descending order (most thrills first)' do


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
          mechanic_rides2 = MechanicRide.create!(ride_id: @ferris.id, mechanic_id: mechanic1.id)
          mechanic_rides2 = MechanicRide.create!(ride_id: @hurler.id, mechanic_id: mechanic1.id)


          visit "/mechanics/#{mechanic1.id}"
          expect(page).to have_content(mechanic1.name)
          expect(page).to have_content(mechanic1.years_of_experience)
          expect(page).to have_content(@jaws.name)
          expect(page).to have_content(@scrambler.name)
          expect(page).to_not have_content(@ferris.name)
          expect(@jaws.name).to appear_before(@scrambler.name)
          expect(@hurler.name).to appear_before(@scrambler.name)
          expect(@hurler.name).to appear_before(@jaws.name)
          save_and_open_page

        end
      end
    end
  end

  describe 'Story 3 - Add a Ride to a Mechanic' do
    describe 'When I go to a mechanics show page' do
      describe 'I see a form to add a ride to their workload' do
        describe 'When I fill in that field with an id of an existing ride and hit submit' do
          describe 'When I go to a mechanics show page' do
            it 'Im taken back to that mechanics show page' do

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
              mechanic_rides2 = MechanicRide.create!(ride_id: @ferris.id, mechanic_id: mechanic1.id)

              visit "/mechanics/#{mechanic1.id}"
              expect(page).to have_content("Add a ride to workload")
              fill_in "Ride id", with: @hurler.id
              click_button("Submit")
              expect(current_path).to eq("/mechanics/#{mechanic1.id}")
              expect(page).to have_content(@hurler.name)

            end
          end
        end
      end
    end
  end
end