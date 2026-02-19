-- ============================================
-- Query: Top Impacted Campaigns
-- Purpose:
-- Identify campaigns with the highest
-- number of error events.
--
-- Diagnostic Logic:
-- Rank campaigns by error count to prioritize
-- debugging and mitigation efforts.
-- ============================================

SELECT 
    campaign_id,
    COUNT(*) AS error_events
FROM ad_events
WHERE event_type = 'error'
GROUP BY campaign_id
ORDER BY error_events DESC;
