Rails.application.config.middleware.use OmniAuth::Builder do
  provider :smugmug, ENV['G74NPxhieE70QY5IV2i9QYeGaoU2EyLe'], ENV['addb646a3dddf5e5af86181f69867722']
end