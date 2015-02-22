# DATA DICTIONARY - HUMAN ACTIVITY RECOGNITION USING SMARTPHONES
### Study design

This table provides accelerometer and gyroscope signals captured from a Samsung Galaxy S II smartphone at a constant rate of 50Hz. 30 volunteers between the ages of 19 and 48 each performed six physical activites wearing the phone. 

The tidyset.txt table contains eighty-eight (88) fields and 180 rows. Averages of the mean and standard deviation signal fields were calculated. The table is sorted by the subject identifier.

This table has been cleaned and only the required information extracted from the original data available at [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The complete data analysis steps of getting, cleaning and gathering of the dataset is availabe in the included [README.md](https://github.com/saifs/GetCleanDataProject/blob/master/README.md).


### Code book

The subject and activity fields do not have units and all of the measurements are normalized so units are of no concern. A short description of the measurements is provided for each measurement type.

**Subject (field 1)**

    Volunteers in 19-48 age bracket
            1..30 .Volunteer number

**Activity (field 2)**

    Physicial activity while wearing smartphone on waist
            WALKING
            WALKING_UPSTAIRS
            WALKING_DOWNSTAIRS
            SITTING
            STANDING
            LYING

**Average of normalized measurements bounded within {-1,1} (fields 3 to 88)**

    Accelerometer 3-axial raw signals for body, in time domain
            3.  Time.domain.body.accelerometer_mean_X.axis
            4.  Time.domain.body.accelerometer_mean_Y.axis
            5.  Time.domain.body.accelerometer_mean_Z.axis
            6.  Time.domain.body.accelerometer_standard.deviation_X.axis
            7.  Time.domain.body.accelerometer_standard.deviation_Y.axis
            8.  Time.domain.body.accelerometer_standard.deviation_Z.axis
    Accelerometer 3-axial raw signals for gravity, in time domain
            9.  Time.domain.gravity.accelerometer_mean_X.axis
            10. Time.domain.gravity.accelerometer_mean_Y.axis
            11. Time.domain.gravity.accelerometer_mean_Z.axis
            12. Time.domain.gravity.accelerometer_standard.deviation_X.axis
            13. Time.domain.gravity.accelerometer_standard.deviation_Y.axis
            14.	Time.domain.gravity.accelerometer_standard.deviation_Z.axis
    Accelerometer 3-axial jerk signals derived from body linear acceleration, in time domain
            15.	Time.domain.body.accelerometer.Jerk_mean_X.axis
            16.	Time.domain.body.accelerometer.Jerk_mean_Y.axis
            17.	Time.domain.body.accelerometer.Jerk_mean_Z.axis
            18.	Time.domain.body.accelerometer.Jerk_standard.deviation_X.axis
            19.	Time.domain.body.accelerometer.Jerk_standard.deviation_Y.axis
            20.	Time.domain.body.accelerometer.Jerk_standard.deviation_Z.axis
    Gyroscope 3-axial raw signals for body, in time domain
            21.	Time.domain.body.gyroscope_mean_X.axis
            22.	Time.domain.body.gyroscope_mean_Y.axis
            23.	Time.domain.body.gyroscope_mean_Z.axis
            24.	Time.domain.body.gyroscope_standard.deviation_X.axis
            25.	Time.domain.body.gyroscope_standard.deviation_Y.axis
            26.	Time.domain.body.gyroscope_standard.deviation_Z.axis
    Gyroscope 3-axial jerk signals derived from body angular velocity, in time domain
            27.	Time.domain.body.gyroscope.Jerk_mean_X.axis
            28.	Time.domain.body.gyroscope.Jerk_mean_Y.axis
            29.	Time.domain.body.gyroscope.Jerk_mean_Z.axis
            30.	Time.domain.body.gyroscope.Jerk_standard.deviation_X.axis
            31.	Time.domain.body.gyroscope.Jerk_standard.deviation_Y.axis
            32.	Time.domain.body.gyroscope.Jerk_standard.deviation_Z.axis
    Magnitude of three-dimensional signals for body and gravity calculated using Euclidean norm, in time domain
            33.	Time.domain.body.accelerometer.Magnitude_mean
            34.	Time.domain.body.accelerometer.Magnitude_standard.deviation
            35.	Time.domain.gravity.accelerometer.Magnitude_mean
            36.	Time.domain.gravity.accelerometer.Magnitude_standard.deviation
            37.	Time.domain.body.accelerometer.Jerk.Magnitude_mean
            38.	Time.domain.body.accelerometer.Jerk.Magnitude_standard.deviation
            39.	Time.domain.body.gyroscope.Magnitude_mean
            40.	Time.domain.body.gyroscope.Magnitude_standard.deviation
            41.	Time.domain.body.gyroscope.Jerk.Magnitude_mean
            42.	Time.domain.body.gyroscope.Jerk.Magnitude_standard.deviation
    Accelerometer 3-axial raw signals for body, in frequency domain
            43.	Frequency.domain.body.accelerometer_mean_X.axis
            44.	Frequency.domain.body.accelerometer_mean_Y.axis
            45.	Frequency.domain.body.accelerometer_mean_Z.axis
            46.	Frequency.domain.body.accelerometer_standard.deviation_X.axis
            47.	Frequency.domain.body.accelerometer_standard.deviation_Y.axis
            48.	Frequency.domain.body.accelerometer_standard.deviation_Z.axis
            49.	Frequency.domain.body.accelerometer_mean.frequency_X.axis
            50.	Frequency.domain.body.accelerometer_mean.frequency_Y.axis
            51.	Frequency.domain.body.accelerometer_mean.frequency_Z.axis
    Accelerometer 3-axial jerk signals derived from body linear acceleration, in frequency domain
            52.	Frequency.domain.body.accelerometer.Jerk_mean_X.axis
            53.	Frequency.domain.body.accelerometer.Jerk_mean_Y.axis
            54.	Frequency.domain.body.accelerometer.Jerk_mean_Z.axis
            55.	Frequency.domain.body.accelerometer.Jerk_standard.deviation_X.axis
            56.	Frequency.domain.body.accelerometer.Jerk_standard.deviation_Y.axis
            57.	Frequency.domain.body.accelerometer.Jerk_standard.deviation_Z.axis
            58.	Frequency.domain.body.accelerometer.Jerk_mean.frequency_X.axis
            59.	Frequency.domain.body.accelerometer.Jerk_mean.frequency_Y.axis
            60.	Frequency.domain.body.accelerometer.Jerk_mean.frequency_Z.axis
    Gyroscope 3-axial raw signals for body, in frequency domain
            61.	Frequency.domain.body.gyroscope_mean_X.axis
            62.	Frequency.domain.body.gyroscope_mean_Y.axis
            63.	Frequency.domain.body.gyroscope_mean_Z.axis
            64.	Frequency.domain.body.gyroscope_standard.deviation_X.axis
            65.	Frequency.domain.body.gyroscope_standard.deviation_Y.axis
            66.	Frequency.domain.body.gyroscope_standard.deviation_Z.axis
            67.	Frequency.domain.body.gyroscope_mean.frequency_X.axis
            68.	Frequency.domain.body.gyroscope_mean.frequency_Y.axis
            69.	Frequency.domain.body.gyroscope_mean.frequency_Z.axis
    Magnitude of three-dimensional signals for body calculated using Euclidean norm, in frequency domain
            70.	Frequency.domain.body.accelerometer.Magnitude_mean
            71.	Frequency.domain.body.accelerometer.Magnitude_standard.deviation
            72.	Frequency.domain.body.accelerometer.Magnitude_mean.frequency
            73.	Frequency.domain.body.accelerometer.Jerk.Magnitude_mean
            74.	Frequency.domain.body.accelerometer.Jerk.Magnitude_standard.deviation
            75.	Frequency.domain.body.accelerometer.Jerk.Magnitude_mean.frequency
            76.	Frequency.domain.body.gyroscope.Magnitude_mean
            77.	Frequency.domain.body.gyroscope.Magnitude_standard.deviation
            78.	Frequency.domain.body.gyroscope.Magnitude_mean.frequency
            79.	Frequency.domain.body.gyroscope.Jerk.Magnitude_mean
            80.	Frequency.domain.body.gyroscope.Jerk.Magnitude_standard.deviation
            81.	Frequency.domain.body.gyroscope.Jerk.Magnitude_mean.frequency
    Angle between two vectors, separated by '_' in variable names, obtained by averaging the signals in a signal window sample
            82.	angle.Time.domain.body.accelerometer.mean_gravity
            83.	angle.Time.domain.body.accelerometer.Jerk.mean_gravity.mean
            84.	angle.Time.domain.body.gyroscope.mean_gravity.mean
            85.	angle.Time.domain.body.gyroscope.Jerk.mean_gravity.mean
            86.	angle.X.axis_gravity.mean
            87.	angle.Y.axis_gravity.mean
            88.	angle.Z.axis_gravity.mean
