require 'rails_helper'

describe "user sees all astronauts" do
  describe "visit /astronauts" do
    it "displays all astronauts" do
      astronaut_one = Astronaut.create(name: "eqreqeq", age: 5, job: "BBBBB")
      astronaut_two = Astronaut.create(name: "UIUIUIUU", age: 9, job: "iihi")

      visit '/astronauts'

      expect(page).to have_content(astronaut_one.name)
      expect(page).to have_content(astronaut_one.age)
      expect(page).to have_content(astronaut_one.job)
      expect(page).to have_content(astronaut_two.name)
      expect(page).to have_content(astronaut_two.age)
      expect(page).to have_content(astronaut_two.job)
    end
    it "displays average age of astronauts" do
      astronaut_one = Astronaut.create(name: "eqreqeq", age: 5, job: "BBBBB")
      astronaut_two = Astronaut.create(name: "UIUIUIUU", age: 9, job: "iihi")

      avg_age = (astronaut_one.age + astronaut_two.age) / 2

      visit '/astronauts'

      expect(page).to have_content("Average Age: #{avg_age}")
    end
    it "displays a list of missions for each astronaut in alphabetical order" do
      astronaut = Astronaut.create(name: "eqreqeq", age: 5, job: "BBBBB")

      mission_one   = astronaut.space_mission.create(title: 'a', trip_length: 1)
      mission_two   = astronaut.space_mission.create(title: 'b', trip_length: 2)
      mission_three = astronaut.space_mission.create(title: 'c', trip_length: 5)

      visit '/astronauts'

      expect(page).to have_content([mission_one.title, mission_two.title, mission_three.title])
    end
  end
end
