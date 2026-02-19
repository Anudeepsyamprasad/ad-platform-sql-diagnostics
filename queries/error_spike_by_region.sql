-- ============================================
-- Query: Error Spike by Region
-- Purpose:
-- Determine which geographic region is most
-- impacted by API errors.
--
-- Diagnostic Logic:
-- Join ad_events -> campaigns -> accounts
-- and aggregate error events by region.
-- ============================================

SELECT 
    a.region,
    COUNT(*) AS error_count
FROM ad_events e
JOIN campaigns c ON e.campaign_id = c.campaign_id
JOIN accounts a ON c.account_id = a.account_id
WHERE e.event_type = 'error'
GROUP BY a.region
ORDER BY error_count DESC;
