SELECT hc.Id,
       hc.ActivityHour,
       hc.Calories,
       hi.TotalIntensity,
       hi.AverageIntensity,
       hs.StepTotal
  FROM hourlyCalories_merged AS hc
       JOIN
       hourlyIntensities_merged AS hi ON hc.Id = hi.Id AND 
                                         hc.ActivityHour = hi.ActivityHour
       JOIN
       hourlySteps_merged AS hs ON hc.Id = hs.Id AND 
                                   hc.ActivityHour = hs.ActivityHour;

                                   
-----------Joine dailyActivity_merged with sleepDay_merged and weightLogInfo_merged. table name is joinedDailyActivity_merged---------------------


SELECT da.Id,
       da.ActivityDate,
       da.TotalSteps,
       da.TotalDistance,
       da.TrackerDistance,
       da.LoggedActivitiesDistance,
       da.VeryActiveDistance + da.ModeratelyActiveDistance + da.LightActiveDistance + da.SedentaryActiveDistance AS TotalActiveDistance,
       da.VeryActiveMinutes + da.FairlyActiveMinutes + da.LightlyActiveMinutes AS TotalActiveMinutes,
       da.SedentaryMinutes,
       da.Calories,
       sd.TotalSleepRecords,
       sd.TotalMinutesAsleep,
       sd.TotalTimeInBed,
       wli.WeightPounds,
       wli.BMI
  FROM dailyActivity_merged AS da
       LEFT JOIN
       sleepDay_merged AS sd ON da.Id = sd.Id AND 
                                da.ActivityDate = sd.SleepDay
       LEFT JOIN
       weightLogInfo_merged AS wli ON da.Id = wli.Id AND 
                                      da.ActivityDate = wli.Date;