#Needed to make separate facebook apps for local and production sites
if Rails.env == "development"
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, 'lA21uA4dz7BVDv18CuhVA', 'Z6ZLQewFa09YeJ6UCXfLegcwqrtMP0huNcIPJJkmt8'
    provider :facebook, '149471855118322', '68570613b48a3b4e678d2134e3685cdd', {:scope => 'publish_stream,offline_access,email'}
  end
else
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, 'lA21uA4dz7BVDv18CuhVA', 'Z6ZLQewFa09YeJ6UCXfLegcwqrtMP0huNcIPJJkmt8'
    provider :facebook, '162816310444184', 'e81605fb206c2b0c98b95ebfab3d7e92', {:scope => 'publish_stream,offline_access,email'}
  end
end

