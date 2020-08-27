require 'rails_helper'

RSpec.describe Partners::Staff::StaffMembersController, type: :routing do
  let(:host) { 'http://partners.vista.test' }

  describe 'routing' do
    it 'routes to #index' do
      expect(get: "#{host}/staff/staff-members").to \
        route_to('partners/staff/staff_members#index')
    end

    it 'routes to #new' do
      expect(get: "#{host}/staff/staff-members/new").to \
        route_to('partners/staff/staff_members#new')
    end

    it 'routes to #show' do
      expect(get: "#{host}/staff/staff-members/1").to \
        route_to('partners/staff/staff_members#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: "#{host}/staff/staff-members/1/edit").to \
        route_to('partners/staff/staff_members#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: "#{host}/staff/staff-members").to \
        route_to('partners/staff/staff_members#create')
    end

    it 'routes to #update via PUT' do
      expect(put: "#{host}/staff/staff-members/1").to \
        route_to('partners/staff/staff_members#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: "#{host}/staff/staff-members/1").to \
        route_to('partners/staff/staff_members#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: "#{host}/staff/staff-members/1").to \
        route_to('partners/staff/staff_members#destroy', id: '1')
    end
  end
end
