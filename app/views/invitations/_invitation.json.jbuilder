json.extract! invitation, :id, :email, :token, :accepted_at, :membership_id, :team_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
