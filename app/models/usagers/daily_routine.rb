# -*- encoding : utf-8 -*-
class Usagers::DailyRoutine < ActiveRecord::Base

  AcceptableDays = ['lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi']
  AcceptablePresences = ['Jour entier', 'Matin', 'Après midi']
  AcceptableMeals = ['Repas normal', 'Repas sans porc', 'Repas végétarien']

  attr_accessible :day, :meal, :presence, :routine_id, :routine

  belongs_to :routine, :class_name => 'Usagers::Routine'#, :dependent => :destroy

  validates :routine, :presence => true
  validate :acceptable_day
  validate :acceptable_presence
  validate :acceptable_meal

  def acceptable_day
      errors[:day] << 'Le jour setté n\' est pas valide' unless self.day.blank? || AcceptableDays.include?(self.day)
  end

  def acceptable_presence
    errors[:presence] << 'La présence settée n\' est pas valide' unless self.presence.blank? || AcceptablePresences.include?(self.presence)
  end

  def acceptable_meal
    errors[:meal] << 'Le repas setté n\' est pas valide' unless self.meal.blank? || AcceptableMeals.include?(self.meal)
  end

end
