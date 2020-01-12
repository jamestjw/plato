class BoardUser < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validate :user_must_belong_to_organisation
  validates_uniqueness_of :user_id, scope: :board_id, :message=>"has already been assigned to this board"

  class Error < StandardError
  end

  private
  def user_must_belong_to_organisation
    unless user.organisations.first == board.organisation
      errors.add(:user_id, "doesn't belong in same organisation as board.")
    end
  end
end
