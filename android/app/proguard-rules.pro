# WorkManager e banco interno Room
-keep class androidx.work.impl.WorkDatabase_Impl { *; }

-keep class * extends androidx.room.RoomDatabase { *; }

-keep class * extends androidx.work.ListenableWorker {
    public <init>(android.content.Context, androidx.work.WorkerParameters);
}

-keepattributes *Annotation*
-keepattributes Signature
-keepattributes InnerClasses
-keepattributes EnclosingMethod