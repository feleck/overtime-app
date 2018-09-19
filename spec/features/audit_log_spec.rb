require 'rails_helper'

describe 'AuditLog Feature' do
  let(:admin_user) { FactoryBot.create(:admin_user) }

  describe 'index' do
    before do
      login_as(admin_user, scope: :user)
      FactoryBot.create(:audit_log)
    end

    it 'has an index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders auditlog content' do
      visit audit_logs_path
      expect(page).to have_content(/SNOW, JON/)
    end

    xit 'cannot be accessed by non admin users' do
    end
  end
end
