---1. 
SELECT trans_type "transportation type"
	   ,SUM(CASE WHEN year BETWEEN 1980 AND 1989 THEN total_acc_num
					   ELSE 0 END) "1980s"
	   ,SUM(CASE WHEN year BETWEEN 1990 AND 1999 THEN total_acc_num
					   ELSE 0 END) "1990s"
	   ,SUM(CASE WHEN year BETWEEN 2000 AND 2009 THEN total_acc_num
					   ELSE 0 END) "2000s"
	   ,SUM(CASE WHEN year BETWEEN 2010 AND 2019 THEN total_acc_num
					   ELSE 0 END) "2010s"
FROM traffic_accident
GROUP BY trans_type;

---2.
SELECT a.trans_type, a.year, a.death_num
FROM traffic_accident a
	 ,(SELECT trans_type
	  		 ,MAX(death_num) death_max
	   FROM traffic_accident
       GROUP BY trans_type) b
WHERE a.trans_type = b.trans_type
	  and a.death_num = b.death_max;
	  
---3.
SELECT trans_type
      ,ROUND(AVG(death_num/total_acc_num  * 100),0) death_per
  FROM traffic_accident
 WHERE total_acc_num > 0
 GROUP BY trans_type;

