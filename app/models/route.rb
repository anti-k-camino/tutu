class Route < ActiveRecord::Base
  has_many :trains
  has_many :stations_routes, dependent: :destroy
  has_many :stations, through: :stations_routes

  validates :name, presence: true
  validate :set_stations
  before_validation :set_name

  def self.search(start_id, finish_id)
    # res = self.joins(:stations).where("stations.name LIKE ?" ,"%#{search_begin}%" ).uniq
    # res1 = self.joins(:stations).where("stations.name LIKE ?" ,"%#{search_end}%" ).uniq

    # SELECT DISTINCT `routes`.* FROM `routes` INNER JOIN `stations_routes`# DISTINCT may be useless
    # ON `stations_routes`.`route_id` = `routes`.`id` INNER JOIN `stations`
    # ON `stations`.`id` = `stations_routes`.`station_id`
    # WHERE (`stations`.`name` LIKE '%Одесса%' OR `stations`.`name` LIKE '%Киев%')
    # GROUP BY routes.id
    # HAVING COUNT(`routes`.*) > 1;

    res = joins(:stations).where('station_id = ?', start_id.to_s)
    res1 = joins(:stations).where('station_id = ?', finish_id.to_s)
    res & res1
  end

  def station(id)
    stations.find(id)
  end

  private

  def set_name
    self.name = "#{stations.first.name}-#{stations.last.name}"
  end

  def set_stations
    errors.add(:base, I18n.t('activerecord.errors.messages.two_names')) if stations.size < 2
  end
end
