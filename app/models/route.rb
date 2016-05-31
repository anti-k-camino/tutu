class Route < ActiveRecord::Base
  has_many :trains
  has_many :stations_routes, dependent: :destroy
  has_many :stations, through: :stations_routes

  validates :name, presence: true
  validate :set_stations  
  before_validation :set_name

  def self.search(search_begin, search_end)     
    #res = self.joins(:stations).where("stations.name LIKE ?" ,"%#{search_begin}%" ).uniq 
    #res1 = self.joins(:stations).where("stations.name LIKE ?" ,"%#{search_end}%" ).uniq 

    #SELECT DISTINCT `routes`.* FROM `routes` INNER JOIN `stations_routes`
    #ON `stations_routes`.`route_id` = `routes`.`id` INNER JOIN `stations`
    #ON `stations`.`id` = `stations_routes`.`station_id`
    #WHERE (`stations`.`name` LIKE '%Одесса%' OR `stations`.`name` LIKE '%Киев%')
    #GROUP BY routes.id
    #HAVING COUNT(`routes`.*) > 1;
    
    res = self.joins(:stations).where("station_id = ?", "#{search_begin}")
    res1 = self.joins(:stations).where("station_id = ?", "#{search_end}")
    res & res1        
  end 

  private

  def set_name
    self.name = "#{stations.first.name}-#{stations.last.name}"
  end

  def set_stations
    errors.add(:base, "Должно быть минимум две станции") if stations.size < 2
  end
end
