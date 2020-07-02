json.extract! page, :id, :title, :last_modification_date, :content, :message, :wiki_id, :created_at, :updated_at
json.url page_url(page, format: :json)
