# Copyright 2015 The Android Open Source Project
# Copyright (C) 2015 Valve Corporation

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
SRC_DIR := ../..
LAYER_DIR := ../generated
THIRD_PARTY := ../third_party

VULKAN_INCLUDE := $(LOCAL_PATH)/$(SRC_DIR)/include

include $(CLEAR_VARS)
LOCAL_MODULE := layer_utils
LOCAL_SRC_FILES += $(SRC_DIR)/layers/vk_layer_config.cpp
LOCAL_SRC_FILES += $(SRC_DIR)/layers/vk_layer_extension_utils.cpp
LOCAL_SRC_FILES += $(SRC_DIR)/layers/vk_layer_utils.cpp
LOCAL_SRC_FILES += $(SRC_DIR)/layers/vk_format_utils.cpp
LOCAL_C_INCLUDES += $(VULKAN_INCLUDE) \
                    $(LOCAL_PATH)/$(LAYER_DIR)/include \
                    $(LOCAL_PATH)/$(SRC_DIR)/layers
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES -fvisibility=hidden
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_core_validation
LOCAL_SRC_FILES += $(SRC_DIR)/layers/core_validation.cpp
LOCAL_SRC_FILES += $(SRC_DIR)/layers/descriptor_sets.cpp
LOCAL_SRC_FILES += $(SRC_DIR)/layers/buffer_validation.cpp
LOCAL_SRC_FILES += $(SRC_DIR)/layers/shader_validation.cpp
LOCAL_SRC_FILES += $(SRC_DIR)/layers/convert_to_renderpass2.cpp
LOCAL_SRC_FILES += $(SRC_DIR)/layers/xxhash.c
LOCAL_C_INCLUDES += $(VULKAN_INCLUDE) \
                    $(LOCAL_PATH)/$(SRC_DIR)/layers \
                    $(LOCAL_PATH)/$(LAYER_DIR)/include
LOCAL_STATIC_LIBRARIES += layer_utils glslang SPIRV-Tools
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES -fvisibility=hidden
LOCAL_LDLIBS    := -llog
LOCAL_LDFLAGS   += -Wl,-Bsymbolic
LOCAL_LDFLAGS   += -Wl,--exclude-libs,ALL
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_parameter_validation
LOCAL_SRC_FILES += $(LAYER_DIR)/include/parameter_validation.cpp
LOCAL_SRC_FILES += $(SRC_DIR)/layers/parameter_validation_utils.cpp
LOCAL_C_INCLUDES += $(VULKAN_INCLUDE) \
                    $(LOCAL_PATH)/$(LAYER_DIR)/include \
                    $(LOCAL_PATH)/$(SRC_DIR)/layers
LOCAL_STATIC_LIBRARIES += layer_utils
LOCAL_CPPFLAGS += -std=c++11 -DVK_PROTOTYPES -Wall -Werror -Wno-unused-function -Wno-unused-const-variable
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -fvisibility=hidden
LOCAL_LDLIBS    := -llog
LOCAL_LDFLAGS   += -Wl,-Bsymbolic
LOCAL_LDFLAGS   += -Wl,--exclude-libs,ALL
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_object_tracker
LOCAL_SRC_FILES += $(LAYER_DIR)/include/object_tracker.cpp
LOCAL_SRC_FILES += $(SRC_DIR)/layers/object_tracker_utils.cpp
LOCAL_C_INCLUDES += $(VULKAN_INCLUDE) \
                    $(LOCAL_PATH)/$(SRC_DIR)/layers \
                    $(LOCAL_PATH)/$(LAYER_DIR)/include
LOCAL_STATIC_LIBRARIES += layer_utils
LOCAL_CPPFLAGS += -std=c++11 -DVK_PROTOTYPES -Wall -Werror -Wno-unused-function -Wno-unused-const-variable
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -fvisibility=hidden
LOCAL_LDLIBS    := -llog
LOCAL_LDFLAGS   += -Wl,-Bsymbolic
LOCAL_LDFLAGS   += -Wl,--exclude-libs,ALL
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_threading
LOCAL_SRC_FILES += $(SRC_DIR)/layers/threading.cpp
LOCAL_C_INCLUDES += $(VULKAN_INCLUDE) \
                    $(LOCAL_PATH)/$(SRC_DIR)/layers \
                    $(LOCAL_PATH)/$(LAYER_DIR)/include
LOCAL_STATIC_LIBRARIES += layer_utils
LOCAL_CPPFLAGS += -std=c++11 -DVK_PROTOTYPES -Wall -Werror -Wno-unused-function -Wno-unused-const-variable
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -fvisibility=hidden
LOCAL_LDLIBS    := -llog
LOCAL_LDFLAGS   += -Wl,-Bsymbolic
LOCAL_LDFLAGS   += -Wl,--exclude-libs,ALL
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_unique_objects
LOCAL_SRC_FILES += $(SRC_DIR)/layers/unique_objects.cpp
LOCAL_C_INCLUDES += $(VULKAN_INCLUDE) \
                    $(LOCAL_PATH)/$(SRC_DIR)/layers \
                    $(LOCAL_PATH)/$(LAYER_DIR)/include
LOCAL_STATIC_LIBRARIES += layer_utils
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES -fvisibility=hidden
LOCAL_LDLIBS    := -llog
LOCAL_LDFLAGS   += -Wl,-Bsymbolic
LOCAL_LDFLAGS   += -Wl,--exclude-libs,ALL
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayerValidationTests
LOCAL_SRC_FILES += $(SRC_DIR)/tests/layer_validation_tests.cpp \
                   $(SRC_DIR)/tests/vktestbinding.cpp \
                   $(SRC_DIR)/tests/vktestframeworkandroid.cpp \
                   $(SRC_DIR)/tests/vkrenderframework.cpp \
                   $(SRC_DIR)/layers/convert_to_renderpass2.cpp \
                   $(LAYER_DIR)/include/vk_safe_struct.cpp \
                   $(THIRD_PARTY)/Vulkan-Tools/common/vulkan_wrapper.cpp
LOCAL_C_INCLUDES += $(VULKAN_INCLUDE) \
                    $(LOCAL_PATH)/$(LAYER_DIR)/include \
                    $(LOCAL_PATH)/$(SRC_DIR)/layers \
                    $(LOCAL_PATH)/$(SRC_DIR)/libs \
                    $(LOCAL_PATH)/$(THIRD_PARTY)/Vulkan-Tools/common

LOCAL_STATIC_LIBRARIES := googletest_main layer_utils shaderc
LOCAL_CPPFLAGS += -std=c++11 -DVK_PROTOTYPES -Wall -Werror -Wno-unused-function -Wno-unused-const-variable
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DNV_EXTENSIONS -DAMD_EXTENSIONS -fvisibility=hidden --include=$(THIRD_PARTY)/Vulkan-Tools/common/vulkan_wrapper.h
LOCAL_LDLIBS := -llog
LOCAL_LDFLAGS   += -Wl,-Bsymbolic
LOCAL_LDFLAGS   += -Wl,--exclude-libs,ALL
include $(BUILD_EXECUTABLE)

# Note: The following module is similar in name to the executable, but differs so that loader won't enumerate the resulting .so
include $(CLEAR_VARS)
LOCAL_MODULE := VulkanLayerValidationTests
LOCAL_SRC_FILES += $(SRC_DIR)/tests/layer_validation_tests.cpp \
                   $(SRC_DIR)/tests/vktestbinding.cpp \
                   $(SRC_DIR)/tests/vktestframeworkandroid.cpp \
                   $(SRC_DIR)/tests/vkrenderframework.cpp \
                   $(SRC_DIR)/layers/convert_to_renderpass2.cpp \
                   $(LAYER_DIR)/include/vk_safe_struct.cpp \
                   $(THIRD_PARTY)/Vulkan-Tools/common/vulkan_wrapper.cpp
LOCAL_C_INCLUDES += $(VULKAN_INCLUDE) \
                    $(LOCAL_PATH)/$(LAYER_DIR)/include \
                    $(LOCAL_PATH)/$(SRC_DIR)/layers \
                    $(LOCAL_PATH)/$(SRC_DIR)/libs \
                    $(LOCAL_PATH)/$(THIRD_PARTY)/Vulkan-Tools/common

LOCAL_STATIC_LIBRARIES := googletest_main layer_utils shaderc
LOCAL_CPPFLAGS += -std=c++11 -DVK_PROTOTYPES -Wall -Werror -Wno-unused-function -Wno-unused-const-variable
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DNV_EXTENSIONS -DAMD_EXTENSIONS -fvisibility=hidden -DVALIDATION_APK --include=$(THIRD_PARTY)/Vulkan-Tools/common/vulkan_wrapper.h
LOCAL_WHOLE_STATIC_LIBRARIES += android_native_app_glue
LOCAL_LDLIBS := -llog -landroid
LOCAL_LDFLAGS := -u ANativeActivity_onCreate
include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)
$(call import-module,third_party/googletest)
$(call import-module,third_party/shaderc)
