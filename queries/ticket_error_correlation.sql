-- ============================================
-- Query: Support Ticket & Error Correlation
-- Purpose:
-- Correlate system error events with
-- customer-reported support tickets.
--
-- Diagnostic Logic:
-- Compare ticket counts per account with
-- associated error events.
-- ============================================

SELECT 
    a.account_name,
    COUNT(DISTINCT t.ticket_id) AS ticket_count,
    COUNT(e.event_id) AS error_events
FROM accounts a
LEFT JOIN support_tickets t ON a.account_id = t.account_id
LEFT JOIN campaigns c ON a.account_id = c.account_id
LEFT JOIN ad_events e ON c.campaign_id = e.campaign_id
WHERE e.event_type = 'error'
GROUP BY a.account_name
ORDER BY error_events DESC;
