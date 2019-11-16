class Album < Hanami::Entity
  def released_today?
    Date.today == released_at
  end
end
