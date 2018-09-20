class StaticController < ApplicationController
  def homepage
    @pending_approvals = Post.where(status: 'submitted')
    @recent_audit_itmes = AuditLog.last(10) # where(status: 'confirmed')
  end
end
