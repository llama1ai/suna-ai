-- Remove deprecated avatar columns migration
-- This migration permanently removes avatar and avatar_color columns since we've switched to image URLs

BEGIN;

-- Drop indexes related to avatar columns
DROP INDEX IF EXISTS idx_agents_avatar;
DROP INDEX IF EXISTS idx_agents_avatar_color;

-- Remove avatar columns from agents table
ALTER TABLE agents DROP COLUMN IF EXISTS avatar;
ALTER TABLE agents DROP COLUMN IF EXISTS avatar_color;

-- Add comment to document the change
COMMENT ON TABLE agents IS 'Agents table - avatar/avatar_color columns removed in favor of profile_image_url in config metadata';

COMMIT;