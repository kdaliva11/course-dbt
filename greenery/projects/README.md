# ANSWERS FOR WEEK 2 QUESTIONS

### What is our user repeat rate?
Repeat Rate - 79.84%

```
SELECT 
    COUNT(DISTINCT CASE WHEN total_orders > 1 THEN user_id ELSE NULL END) AS users_w_1plus_order,
    COUNT(DISTINCT CASE WHEN total_orders IS NOT NULL THEN user_id ELSE NULL END) AS total_users_w_orders, 
    users_w_1plus_order / total_users_w_orders AS repeat_rate
FROM user_order_facts
```

### Which orders changed from week 1 to week 2
3 orders change from week 1 to week 2. 

```
SELECT * FROM postgres_orders_snapshots

WHERE dbt_valid_to IS NOT NULL
```