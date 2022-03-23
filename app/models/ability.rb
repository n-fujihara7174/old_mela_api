# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    #管理者権限
    if user.has_role?(:admin)
      can :manage, :all #全てのモデルに対して全ての操作が可能
      can :access_admin_page, :all  #管理者画面に遷移可能

    #ゲスト権限
    elsif user.has_role?(:read_only)
      can :read, :all #全てのテーブルの閲覧のみが可能
      cannot :access_admin_page, :all #管理者画面は遷移不可
    else
      cannot :read, :all
    end

  end
end
