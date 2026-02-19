-- ============================================
-- Query: Impression Drop Detection
-- Purpose:
-- Identify campaigns experiencing reduced impression
-- volume after March 10, 2026.
--
-- Diagnostic Logic:
-- Aggregate impressions by campaign and date
-- to detect sudden drops in delivery.
-- ============================================

SELECT 
    campaign_id,
    DATE(event_timestamp) AS event_date,
    COUNT(*) AS impressions
FROM ad_events
WHERE event_type = 'impression'
GROUP BY campaign_id, event_date
ORDER BY campaign_id, event_date;
