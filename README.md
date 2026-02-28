# Ad Platform SQL Diagnostic System

## Overview

This project simulates a real-world Product Support Engineering workflow for diagnosing ad delivery issues using SQL. It models a simplified advertising platform and demonstrates how data can be used to detect anomalies, isolate root causes, and correlate system failures with customer impact.

The focus of this project is not dashboarding or UI, but structured investigation using relational data analysis.

---

## Incident Scenario

On March 10, 2026, a backend rollout impacted campaigns in the APAC region.

Observed symptoms:
- Increased API error events
- Reduced impression delivery for specific campaigns
- Rise in customer support tickets

This project simulates how a Product Support Engineer would:
- Detect anomalies using SQL
- Identify impacted campaigns and regions
- Correlate system errors with customer reports
- Propose next debugging steps

---

## System Schema

The system includes four core tables:

- `accounts` – Advertiser accounts and regions  
- `campaigns` – Campaign metadata linked to accounts  
- `ad_events` – Impression, click, and error events  
- `support_tickets` – Customer-reported issues  

The schema includes foreign keys and constraints to simulate production-grade relational modeling.

---

## Diagnostic Workflow

### 1. Impression Drop Detection
Aggregate impressions by campaign and date to identify delivery degradation.

### 2. Error Spike Analysis
Group error events by date to detect anomaly windows.

### 3. Region-Level Root Cause Isolation
Join `ad_events → campaigns → accounts` to determine geographic concentration of errors.

### 4. Customer Impact Correlation
Compare support ticket volume against system error counts to assess customer-visible impact.

---

## Key Findings

- APAC region showed the highest error concentration after March 10.
- Campaign 101 (Alpha Spring Sale) experienced a noticeable impression drop during the incident window.
- APAC accounts generated increased support tickets during the same period.
- The issue likely originated from a region-specific API or deployment change.

---

## Engineering Considerations

If this were a production system with high event volume:

- Add indexing on `event_timestamp`, `campaign_id`, and `event_type`
- Implement automated anomaly detection thresholds
- Monitor error-rate percentages rather than raw counts
- Validate deployment logs for region-specific rollouts

---

## Tech Stack

- SQLite
- SQL (Joins, Aggregations, Time-based Grouping)
- Structured Diagnostic Analysis

---

## Future Improvements (v2)

- Automated daily anomaly detection queries
- SLA breach monitoring
- Error rate percentage calculations
- Simulated deployment logs table
