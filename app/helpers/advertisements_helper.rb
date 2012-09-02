module AdvertisementsHelper
  def advertisement_type(type_id)
    type = Type.where(:id => type_id).first
    type.type_name
  end
end