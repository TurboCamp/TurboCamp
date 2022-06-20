require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'project validation' do 
    let(:project) { create(:project) }
    
    context "title validate" do
      it 'project title can not be nil' do
        project.title = nil
        expect(project).to_not be_valid
      end

      it 'project title should be unique' do 
        p1 = Project.new(title:project.title )
        expect{p1.save!}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
    context 'description validate' do 
      it 'project description can not be nil' do
        project.description = nil
        expect(project).to_not be_valid
      end
      
      it 'project description length maximum is 50' do 
        project.description = 'd' * 51 
        expect(project).to_not be_valid
      end
    end
  end
end

