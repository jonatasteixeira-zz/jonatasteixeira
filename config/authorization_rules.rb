ALLOW_ROLE_TESTING = false

module Authorization
  def self.activate_authorization_rules_browser?
    ALLOW_ROLE_TESTING and Rails.env.development?
  end
end

authorization do
  role :admin do
    has_permission_on [:users, :posts, :comments, :roles, :assignments], :to => :manage
  end

  role :guest do
    has_permission_on :posts, :to => :read
    has_permission_on :users, :to => :create
    has_permission_on :comments, :to => :create
    has_permission_on :comments, :to => [:update, :delete] do
      if_attribute :user => is { user }
    end
  end

  role :user do
    includes :guest
    has_permission_on :posts, :to => :create
    has_permission_on :posts, :to => [:update, :delete] do
      if_attribute :user => is { user }
    end
  end
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
