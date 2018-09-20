class StaticController < ApplicationController
  def homepage
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.submitted
      @recent_audit_itmes = AuditLog.last(10) # where(status: 'confirmed')
    else
      # smth else
    end
  end
end
