# frozen_string_literal: true

JWTSessions.algorithm = 'HS256'
JWTSessions.encryption_key = Rails.application.credentials.secret_jwt_encryption_key
# JWTSessions.access_exp_time = 3600 # 1 hour in seconds
# JWTSessions.refresh_exp_time = 604_800 # 1 week in seconds
