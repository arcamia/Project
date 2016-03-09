# Copyright 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Gapps dependencies
PRODUCT_COPY_FILES +=\
	vendor/gapps/hammerhead/proprietary/system/etc/permissions/com.google.android.camera.experimental2015.xml:system/etc/permissions/com.google.android.camera.experimental2015.xml:google \
	vendor/gapps/hammerhead/proprietary/system/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml:google\
	vendor/gapps/hammerhead/proprietary/system/etc/permissions/com.google.android.dialer.support.xml:system/etc/permissions/com.google.android.dialer.support.xml:google\
	vendor/gapps/hammerhead/proprietary/system/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml:google\
	vendor/gapps/hammerhead/proprietary/system/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml:google\
	vendor/gapps/hammerhead/proprietary/system/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml:google\
	vendor/gapps/hammerhead/proprietary/system/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar:google \
	vendor/gapps/hammerhead/proprietary/system/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar:google \
	vendor/gapps/hammerhead/proprietary/system/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar:google \
	vendor/gapps/hammerhead/proprietary/system/framework/com.google.android.camera.experimental2015.jar:system/framework/com.google.android.camera.experimental2015.jar:google \
	vendor/gapps/hammerhead/proprietary/system/framework/com.google.android.dialer.support.jar:system/framework/com.google.android.dialer.support.jar:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/c_fst:system/usr/srec/en-US/c_fst:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/action.pumpkin:system/usr/srec/en-US/action.pumpkin:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/class_normalizer.mfar:system/usr/srec/en-US/class_normalizer.mfar:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/CLG.prewalk.fst:system/usr/srec/en-US/CLG.prewalk.fst:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/commands.abnf:system/usr/srec/en-US/commands.abnf:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/compile_grammar.config:system/usr/srec/en-US/compile_grammar.config:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/config.pumpkin:system/usr/srec/en-US/config.pumpkin:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/CONTACTS.fst:system/usr/srec/en-US/CONTACTS.fst:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/CONTACTS.syms:system/usr/srec/en-US/CONTACTS.syms:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/contacts.abnf:system/usr/srec/en-US/contacts.abnf:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/dict:system/usr/srec/en-US/dict:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/dictation.config:system/usr/srec/en-US/dictation.config:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/dist_belief:system/usr/srec/en-US/dist_belief:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/dnn:system/usr/srec/en-US/dnn:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/endpointer_dictation.config:system/usr/srec/en-US/endpointer_dictation.config:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/endpointer_model.mmap:system/usr/srec/en-US/endpointer_model.mmap:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/endpointer_voicesearch.config:system/usr/srec/en-US/endpointer_voicesearch.config:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/g2p.data:system/usr/srec/en-US/g2p.data:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/g2p_fst:system/usr/srec/en-US/g2p_fst:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/grammar.config:system/usr/srec/en-US/grammar.config:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/graphemes.syms:system/usr/srec/en-US/graphemes.syms:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/hmmlist:system/usr/srec/en-US/hmmlist:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/hmm_symbols:system/usr/srec/en-US/hmm_symbols:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/input_mean_std_dev:system/usr/srec/en-US/input_mean_std_dev:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/lexicon.U.fst:system/usr/srec/en-US/lexicon.U.fst:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/lstm_model.uint8.data:system/usr/srec/en-US/lstm_model.uint8.data:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/magic_mic.config:system/usr/srec/en-US/magic_mic.config:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/metadata:system/usr/srec/en-US/metadata:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/normalizer.mfar:system/usr/srec/en-US/normalizer.mfar:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/norm_fst:system/usr/srec/en-US/norm_fst:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/offensive_word_normalizer.mfar:system/usr/srec/en-US/offensive_word_normalizer.mfar:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/phonelist:system/usr/srec/en-US/phonelist:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/phonelist.syms:system/usr/srec/en-US/phonelist.syms:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/phonemes.syms:system/usr/srec/en-US/phonemes.syms:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/rescoring.fst.louds:system/usr/srec/en-US/rescoring.fst.louds:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/semantics.pumpkin:system/usr/srec/en-US/semantics.pumpkin:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/voice_actions.config:system/usr/srec/en-US/voice_actions.config:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/voice_actions_compiler.config:system/usr/srec/en-US/voice_actions_compiler.config:google \
	vendor/gapps/hammerhead/proprietary/system/usr/srec/en-US/wordlist.syms:system/usr/srec/en-US/wordlist.syms:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.1847.114.so:system/app/Chrome/lib/arm/libchrome.1847.114.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.1985.135.so:system/app/Chrome/lib/arm/libchrome.1985.135.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchromium_android_linker.so:system/app/Chrome/lib/arm/libchromium_android_linker.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.1916.122.so:system/app/Chrome/lib/arm/libchrome.1916.122.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.2062.117.so:system/app/Chrome/lib/arm/libchrome.2062.117.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.1916.138.so:system/app/Chrome/lib/arm/libchrome.1916.138.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.2125.102.so:system/app/Chrome/lib/arm/libchrome.2125.102.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.1916.141.so:system/app/Chrome/lib/arm/libchrome.1916.141.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.2125.114.so:system/app/Chrome/lib/arm/libchrome.2125.114.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.1985.122.so:system/app/Chrome/lib/arm/libchrome.1985.122.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.2171.37.so:system/app/Chrome/lib/arm/libchrome.2171.37.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.1985.128.so:system/app/Chrome/lib/arm/libchrome.1985.128.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.2171.59.so:system/app/Chrome/lib/arm/libchrome.2171.59.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchrome.1985.131.so:system/app/Chrome/lib/arm/libchrome.1985.131.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Chrome/lib/arm/libchromeview.so:system/app/Chrome/lib/arm/libchromeview.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Drive/lib/arm/libbitmap_parcel.so:system/app/Drive/lib/arm/libbitmap_parcel.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Drive/lib/arm/libdocscanner_image.so:system/app/Drive/lib/arm/libdocscanner_image.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Drive/lib/arm/libfoxit.so:system/app/Drive/lib/arm/libfoxit.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Drive/lib/arm/librawpixeldata_native.so:system/app/Drive/lib/arm/librawpixeldata_native.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Drive/lib/arm/librectifier.so:system/app/Drive/lib/arm/librectifier.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Drive/lib/arm/libwebp_android.so:system/app/Drive/lib/arm/libwebp_android.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/libgcam.so:system/app/GoogleCamera/lib/arm/libgcam.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/librefocus.so:system/app/GoogleCamera/lib/arm/librefocus.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/libgcam_swig_jni.so:system/app/GoogleCamera/lib/arm/libgcam_swig_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/librs.layered_filter_fast_f32.so:system/app/GoogleCamera/lib/arm/librs.layered_filter_fast_f32.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/libjni_jpegutil.so:system/app/GoogleCamera/lib/arm/libjni_jpegutil.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/librsjni.so:system/app/GoogleCamera/lib/arm/librsjni.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/libjni_tinyplanet.so:system/app/GoogleCamera/lib/arm/libjni_tinyplanet.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/libRSSupport.so:system/app/GoogleCamera/lib/arm/libRSSupport.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/libjpeg.so:system/app/GoogleCamera/lib/arm/libjpeg.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/libRSSupportIO.so:system/app/GoogleCamera/lib/arm/libRSSupportIO.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/liblightcycle.so:system/app/GoogleCamera/lib/arm/liblightcycle.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleCamera/lib/arm/libnativehelper_compat_libc++.so:system/app/GoogleCamera/lib/arm/libnativehelper_compat_libc++.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleTTS/lib/arm/libtts_android.so:system/app/GoogleTTS/lib/arm/libtts_android.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/GoogleTTS/lib/arm/libtts_android_neon.so:system/app/GoogleTTS/lib/arm/libtts_android_neon.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Maps/lib/arm/libcrashreporterer.so:system/app/Maps/lib/arm/libcrashreporterer.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Maps/lib/arm/libgmm-jni.so:system/app/Maps/lib/arm/libgmm-jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Maps/lib/arm/libmognet_jni.so:system/app/Maps/lib/arm/libmognet_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Photos/lib/arm/libconsumerphotoeditor_native.so:system/app/Photos/lib/arm/libconsumerphotoeditor_native.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Photos/lib/arm/libcrashreporterer.so:system/app/Photos/lib/arm/libcrashreporterer.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Photos/lib/arm/libcronet.so:system/app/Photos/lib/arm/libcronet.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Photos/lib/arm/libfilterframework_jni.so:system/app/Photos/lib/arm/libfilterframework_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Photos/lib/arm/libframesequence.so:system/app/Photos/lib/arm/libframesequence.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/Photos/lib/arm/libmoviemaker-jni.so:system/app/Photos/lib/arm/libmoviemaker-jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/PrebuiltKeep/lib/arm/libsketchology_native.so:system/app/PrebuiltKeep/lib/arm/libsketchology_native.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/Hangouts/lib/arm/libcrashreporterer.so:system/priv-app/Hangouts/lib/arm/libcrashreporterer.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/Hangouts/lib/arm/libcronet.so:system/priv-app/Hangouts/lib/arm/libcronet.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/Hangouts/lib/arm/libframesequence.so:system/priv-app/Hangouts/lib/arm/libframesequence.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/Hangouts/lib/arm/libvideochat_jni.so:system/priv-app/Hangouts/lib/arm/libvideochat_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltBugle/lib/arm/libframesequence.so:system/priv-app/PrebuiltBugle/lib/arm/libframesequence.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltBugle/lib/arm/libgiftranscode.so:system/priv-app/PrebuiltBugle/lib/arm/libgiftranscode.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libAppDataSearch.so:system/priv-app/PrebuiltGmsCore/lib/arm/libAppDataSearch.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libappstreaming_jni.so:system/priv-app/PrebuiltGmsCore/lib/arm/libappstreaming_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libconscrypt_gmscore_jni.so:system/priv-app/PrebuiltGmsCore/lib/arm/libconscrypt_gmscore_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libdirect-audio.so:system/priv-app/PrebuiltGmsCore/lib/arm/libdirect-audio.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_base.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_base.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_support.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_support.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libgmscore.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgmscore.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libgms-ocrclient.so:system/priv-app/PrebuiltGmsCore/lib/arm/libgms-ocrclient.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libjgcastservice.so:system/priv-app/PrebuiltGmsCore/lib/arm/libjgcastservice.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libleveldbjni.so:system/priv-app/PrebuiltGmsCore/lib/arm/libleveldbjni.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libNearbyApp.so:system/priv-app/PrebuiltGmsCore/lib/arm/libNearbyApp.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libsslwrapper_jni.so:system/priv-app/PrebuiltGmsCore/lib/arm/libsslwrapper_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libwearable-selector.so:system/priv-app/PrebuiltGmsCore/lib/arm/libwearable-selector.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/PrebuiltGmsCore/lib/arm/libWhisper.so:system/priv-app/PrebuiltGmsCore/lib/arm/libWhisper.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/Velvet/lib/arm/libcronet.so:system/priv-app/Velvet/lib/arm/libcronet.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/Velvet/lib/arm/libgoogle_speech_jni.so:system/priv-app/Velvet/lib/arm/libgoogle_speech_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/Velvet/lib/arm/libgoogle_speech_micro_jni.so:system/priv-app/Velvet/lib/arm/libgoogle_speech_micro_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/Velvet/lib/arm/libnativecrashreporter.so:system/priv-app/Velvet/lib/arm/libnativecrashreporter.so:google \
	vendor/gapps/hammerhead/proprietary/system/priv-app/Velvet/lib/arm/liboffline_actions_jni.so:system/priv-app/Velvet/lib/arm/liboffline_actions_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/EditorsDocs/lib/arm/libkix_ndk1.so:system/app/EditorsDocs/lib/arm/libkix_ndk1.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/EditorsDocs/lib/arm/librawpixeldata_native.so:system/app/EditorsDocs/lib/arm/librawpixeldata_native.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/EditorsDocs/lib/arm/libwebp_android.so:system/app/EditorsDocs/lib/arm/libwebp_android.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/FaceLock/lib/arm/libfacelock_jni.so:system/app/FaceLock/lib/arm/libfacelock_jni.so:google \
	vendor/gapps/hammerhead/proprietary/system/app/FaceLock/lib/arm/libfilterpack_facedetect.so:system/app/FaceLock/lib/arm/libfilterpack_facedetect.so:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/lib/libfrsdk.so:system/vendor/lib/libfrsdk.so:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/landmark_group_meta_data.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/landmark_group_meta_data.bin:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-tree7-wmd.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-tree7-wmd.bin:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32-tree7-wmd.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32-tree7-wmd.bin:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-3-tree7-wmd.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.8/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-3-tree7-wmd.bin:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-r0-ri30.4a-v24-tree7-2-wmd.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-r0-ri30.4a-v24-tree7-2-wmd.bin:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-rn30-ri30.5-v24-tree7-2-wmd.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-rn30-ri30.5-v24-tree7-2-wmd.bin:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-rp30-ri30.5-v24-tree7-2-wmd.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/head-y0-yi45-p0-pi45-rp30-ri30.5-v24-tree7-2-wmd.bin:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/pose-r.8.1.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/pose-r.8.1.bin:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/pose-y-r.8.1.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.7.1/pose-y-r.8.1.bin:google \
	vendor/gapps/hammerhead/proprietary/system/vendor/pittpatt/models/recognition/face.face.y0-y0-71-N-tree_7-wmd.bin:system/vendor/pittpatt/models/recognition/face.face.y0-y0-71-N-tree_7-wmd.bin:google \

PRODUCT_PACKAGES+=\
	Books \
	CalendarGooglePrebuilt \
	Chrome \
	ConfigUpdater \
	Drive \
	GoogleCalendarSyncAdapter \
	GoogleCamera \
	GoogleHome \
	GoogleQuickSearchBox \
	GoogleTTS \
	HangoutsDialer \
	Maps \
	Music2 \
	PdfViewer \
	Photos \
	PrebuiltDeskClockGoogle \
	PrebuiltBugle \
	PrebuiltExchange3Google \
	PrebuiltGmail \
	PrebuiltKeep \
	PrebuiltNewsWeather \
	talkback \
	YouTube \
	GoogleBackupTransport \
	GoogleFeedback \
	GoogleLoginService \
	GoogleOneTimeInitializer \
	GooglePartnerSetup \
	GoogleServicesFramework \
	Hangouts \
	Phonesky \
	PrebuiltGmsCore \
	SetupWizard \
	TagGoogle \
	Velvet \
	WebViewGoogle \
	LatinImeGoogle \
	EditorsDocs \
	FaceLock \
	ChromeBookmarksSyncAdapter \
	GoogleContactsSyncAdapter \
