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
  end
end
