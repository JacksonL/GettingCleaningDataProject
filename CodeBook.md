Code Book
=========

Variables
---------

Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying). The first two columns are the variables:

subject  
activity

'subject' has a value from 1 - 30 representing one of the 30 volunteers described above. 'activity' has one of 6 values described above, representing the activity being performed. 

The remaining 66 columns selected for this database come from the accelerometer and gyroscope 3-axial raw signals time.acc-xyz and time.gyro-xyz. These time domain signals (prefix 'time') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time.bodyacc-xyz and time.gravityacc-xyz) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time.bodyaccjerk-xyz and time.bodygyrojerk-xyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time.bodyaccmag, time.gravityaccmag, time.bodyaccjerkmag, time.bodygyromag, time.bodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency.bodyacc-xyz, frequency.bodyaccjerk-xyz, frequency.bodygyro-xyz, frequency.bodybodyaccjerkmag, frequency.bodybodygyromag, frequency.bodybodygyrojerkmag. (Note the 'frequency' prefix to indicate frequency domain signals). 

The set of variables that were estimated from these signals are: 

'.mean': Mean value
'.std': Standard deviation

These signals were used to estimate variables of the feature vector for each pattern:  
'.xyz' is used to denote 3-axial signals in the X, Y and Z directions.

time.bodyacc.mean.x  
time.bodyacc.mean.y  
time.bodyacc.mean.z  
time.bodyacc.std.x  
time.bodyacc.std.y  
time.bodyacc.std.z  
time.gravityacc.mean.x  
time.gravityacc.mean.y  
time.gravityacc.mean.z  
time.gravityacc.std.x  
time.gravityacc.std.y  
time.gravityacc.std.z  
time.bodyaccjerk.mean.x  
time.bodyaccjerk.mean.y  
time.bodyaccjerk.mean.z  
time.bodyaccjerk.std.x  
time.bodyaccjerk.std.y  
time.bodyaccjerk.std.z  
time.bodygyro.mean.x  
time.bodygyro.mean.y  
time.bodygyro.mean.z  
time.bodygyro.std.x  
time.bodygyro.std.y  
time.bodygyro.std.z  
time.bodygyrojerk.mean.x  
time.bodygyrojerk.mean.y  
time.bodygyrojerk.mean.z  
time.bodygyrojerk.std.x  
time.bodygyrojerk.std.y  
time.bodygyrojerk.std.z  
time.bodyaccmag.mean  
time.bodyaccmag.std  
time.gravityaccmag.mean  
time.gravityaccmag.std  
time.bodyaccjerkmag.mean  
time.bodyaccjerkmag.std  
time.bodygyromag.mean  
time.bodygyromag.std  
time.bodygyrojerkmag.mean  
time.bodygyrojerkmag.std  
frequency.bodyacc.mean.x  
frequency.bodyacc.mean.y  
frequency.bodyacc.mean.z  
frequency.bodyacc.std.x  
frequency.bodyacc.std.y  
frequency.bodyacc.std.z  
frequency.bodyaccjerk.mean.x  
frequency.bodyaccjerk.mean.y  
frequency.bodyaccjerk.mean.z  
frequency.bodyaccjerk.std.x  
frequency.bodyaccjerk.std.y  
frequency.bodyaccjerk.std.z  
frequency.bodygyro.mean.x  
frequency.bodygyro.mean.y  
frequency.bodygyro.mean.z  
frequency.bodygyro.std.x  
frequency.bodygyro.std.y  
frequency.bodygyro.std.z  
frequency.bodyaccmag.mean  
frequency.bodyaccmag.std  
frequency.bodybodyaccjerkmag.mean  
frequency.bodybodyaccjerkmag.std  
frequency.bodybodygyromag.mean  
frequency.bodybodygyromag.std  
frequency.bodybodygyrojerkmag.mean  
frequency.bodybodygyrojerkmag.std  

End Values
----------

Finally all of the data has been averaged by subject/activity/variable. So the end result contains 180 rows of data (30 participants times 6 activities).